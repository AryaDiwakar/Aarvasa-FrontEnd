const express = require('express');
const { body, validationResult, query } = require('express-validator');
const Property = require('../models/Property');
const User = require('../models/User');
const { uploadToCloudinary } = require('../utils/cloudinary');

const router = express.Router();

// @route   GET /api/properties
// @desc    Get all properties with filtering and pagination
// @access  Public
router.get('/', [
  query('page').optional().isInt({ min: 1 }),
  query('limit').optional().isInt({ min: 1, max: 50 }),
  query('type').optional().isIn(['apartment', 'house', 'villa', 'commercial', 'land', 'office']),
  query('category').optional().isIn(['residential', 'commercial', 'industrial', 'agricultural']),
  query('purpose').optional().isIn(['sale', 'rent']),
  query('minPrice').optional().isFloat({ min: 0 }),
  query('maxPrice').optional().isFloat({ min: 0 }),
  query('city').optional().isString(),
  query('state').optional().isString(),
  query('bedrooms').optional().isInt({ min: 0 }),
  query('bathrooms').optional().isInt({ min: 0 }),
  query('furnishing').optional().isIn(['furnished', 'semi-furnished', 'unfurnished']),
  query('sortBy').optional().isIn(['price', 'createdAt', 'views', 'pricePerSqft']),
  query('sortOrder').optional().isIn(['asc', 'desc'])
], async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        error: true,
        message: 'Validation failed',
        errors: errors.array()
      });
    }

    const {
      page = 1,
      limit = 10,
      type,
      category,
      purpose,
      minPrice,
      maxPrice,
      city,
      state,
      bedrooms,
      bathrooms,
      furnishing,
      sortBy = 'createdAt',
      sortOrder = 'desc'
    } = req.query;

    // Build filter object
    const filter = { status: 'available' };
    
    if (type) filter.type = type;
    if (category) filter.category = category;
    if (purpose) filter.purpose = purpose;
    if (city) filter['location.city'] = new RegExp(city, 'i');
    if (state) filter['location.state'] = new RegExp(state, 'i');
    if (bedrooms) filter['specifications.bedrooms'] = { $gte: parseInt(bedrooms) };
    if (bathrooms) filter['specifications.bathrooms'] = { $gte: parseInt(bathrooms) };
    if (furnishing) filter['specifications.furnishing'] = furnishing;
    
    // Price filter
    if (minPrice || maxPrice) {
      filter.price = {};
      if (minPrice) filter.price.$gte = parseFloat(minPrice);
      if (maxPrice) filter.price.$lte = parseFloat(maxPrice);
    }

    // Build sort object
    const sort = {};
    sort[sortBy] = sortOrder === 'asc' ? 1 : -1;

    // Execute query with pagination
    const skip = (parseInt(page) - 1) * parseInt(limit);
    
    const properties = await Property.find(filter)
      .populate('owner', 'name email phone')
      .populate('agent', 'name email phone')
      .sort(sort)
      .skip(skip)
      .limit(parseInt(limit));

    const total = await Property.countDocuments(filter);

    res.json({
      error: false,
      data: {
        properties,
        pagination: {
          currentPage: parseInt(page),
          totalPages: Math.ceil(total / parseInt(limit)),
          totalItems: total,
          itemsPerPage: parseInt(limit)
        }
      }
    });

  } catch (error) {
    console.error('Get properties error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching properties'
    });
  }
});

// @route   GET /api/properties/:id
// @desc    Get property by ID
// @access  Public
router.get('/:id', async (req, res) => {
  try {
    const property = await Property.findById(req.params.id)
      .populate('owner', 'name email phone')
      .populate('agent', 'name email phone');

    if (!property) {
      return res.status(404).json({
        error: true,
        message: 'Property not found'
      });
    }

    // Increment view count
    property.views += 1;
    await property.save();

    res.json({
      error: false,
      data: { property }
    });

  } catch (error) {
    console.error('Get property error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching property'
    });
  }
});

// @route   POST /api/properties
// @desc    Create new property
// @access  Private
router.post('/', [
  body('title').trim().isLength({ min: 5, max: 100 }).withMessage('Title must be between 5 and 100 characters'),
  body('description').isLength({ min: 10, max: 1000 }).withMessage('Description must be between 10 and 1000 characters'),
  body('type').isIn(['apartment', 'house', 'villa', 'commercial', 'land', 'office']).withMessage('Invalid property type'),
  body('category').isIn(['residential', 'commercial', 'industrial', 'agricultural']).withMessage('Invalid category'),
  body('purpose').isIn(['sale', 'rent']).withMessage('Invalid purpose'),
  body('price').isFloat({ min: 0 }).withMessage('Price must be a positive number'),
  body('location.address').notEmpty().withMessage('Address is required'),
  body('location.city').notEmpty().withMessage('City is required'),
  body('location.state').notEmpty().withMessage('State is required'),
  body('specifications.area.size').isFloat({ min: 0 }).withMessage('Area size must be a positive number')
], async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        error: true,
        message: 'Validation failed',
        errors: errors.array()
      });
    }

    const propertyData = {
      ...req.body,
      owner: req.user.userId
    };

    const property = new Property(propertyData);
    await property.save();

    const populatedProperty = await Property.findById(property._id)
      .populate('owner', 'name email phone');

    res.status(201).json({
      error: false,
      message: 'Property created successfully',
      data: { property: populatedProperty }
    });

  } catch (error) {
    console.error('Create property error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while creating property'
    });
  }
});

// @route   PUT /api/properties/:id
// @desc    Update property
// @access  Private
router.put('/:id', [
  body('title').optional().trim().isLength({ min: 5, max: 100 }),
  body('description').optional().isLength({ min: 10, max: 1000 }),
  body('price').optional().isFloat({ min: 0 })
], async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        error: true,
        message: 'Validation failed',
        errors: errors.array()
      });
    }

    const property = await Property.findById(req.params.id);
    if (!property) {
      return res.status(404).json({
        error: true,
        message: 'Property not found'
      });
    }

    // Check if user owns the property or is admin
    if (property.owner.toString() !== req.user.userId && req.user.role !== 'admin') {
      return res.status(403).json({
        error: true,
        message: 'Not authorized to update this property'
      });
    }

    // Update property
    Object.assign(property, req.body);
    await property.save();

    const updatedProperty = await Property.findById(property._id)
      .populate('owner', 'name email phone')
      .populate('agent', 'name email phone');

    res.json({
      error: false,
      message: 'Property updated successfully',
      data: { property: updatedProperty }
    });

  } catch (error) {
    console.error('Update property error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while updating property'
    });
  }
});

// @route   DELETE /api/properties/:id
// @desc    Delete property
// @access  Private
router.delete('/:id', async (req, res) => {
  try {
    const property = await Property.findById(req.params.id);
    if (!property) {
      return res.status(404).json({
        error: true,
        message: 'Property not found'
      });
    }

    // Check if user owns the property or is admin
    if (property.owner.toString() !== req.user.userId && req.user.role !== 'admin') {
      return res.status(403).json({
        error: true,
        message: 'Not authorized to delete this property'
      });
    }

    await Property.findByIdAndDelete(req.params.id);

    res.json({
      error: false,
      message: 'Property deleted successfully'
    });

  } catch (error) {
    console.error('Delete property error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while deleting property'
    });
  }
});

// @route   POST /api/properties/:id/favorite
// @desc    Toggle favorite property
// @access  Private
router.post('/:id/favorite', async (req, res) => {
  try {
    const property = await Property.findById(req.params.id);
    if (!property) {
      return res.status(404).json({
        error: true,
        message: 'Property not found'
      });
    }

    const user = await User.findById(req.user.userId);
    const isFavorited = user.favorites.includes(property._id);

    if (isFavorited) {
      // Remove from favorites
      user.favorites = user.favorites.filter(id => id.toString() !== property._id.toString());
      property.favorites = property.favorites.filter(id => id.toString() !== req.user.userId.toString());
    } else {
      // Add to favorites
      user.favorites.push(property._id);
      property.favorites.push(req.user.userId);
    }

    await user.save();
    await property.save();

    res.json({
      error: false,
      message: isFavorited ? 'Property removed from favorites' : 'Property added to favorites',
      data: { isFavorited: !isFavorited }
    });

  } catch (error) {
    console.error('Toggle favorite error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while toggling favorite'
    });
  }
});

// @route   GET /api/properties/search/suggestions
// @desc    Get search suggestions
// @access  Public
router.get('/search/suggestions', async (req, res) => {
  try {
    const { q } = req.query;
    if (!q || q.length < 2) {
      return res.json({
        error: false,
        data: { suggestions: [] }
      });
    }

    const suggestions = await Property.aggregate([
      {
        $match: {
          $or: [
            { 'location.city': { $regex: q, $options: 'i' } },
            { 'location.state': { $regex: q, $options: 'i' } },
            { 'location.locality': { $regex: q, $options: 'i' } },
            { title: { $regex: q, $options: 'i' } }
          ]
        }
      },
      {
        $group: {
          _id: null,
          cities: { $addToSet: '$location.city' },
          states: { $addToSet: '$location.state' },
          localities: { $addToSet: '$location.locality' }
        }
      }
    ]);

    const result = suggestions[0] || { cities: [], states: [], localities: [] };
    
    res.json({
      error: false,
      data: {
        suggestions: [
          ...result.cities.slice(0, 5),
          ...result.states.slice(0, 3),
          ...result.localities.slice(0, 3)
        ]
      }
    });

  } catch (error) {
    console.error('Search suggestions error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching suggestions'
    });
  }
});

// @route   GET /api/properties/featured
// @desc    Get featured properties
// @access  Public
router.get('/featured', async (req, res) => {
  try {
    const featuredProperties = await Property.find({
      status: 'available',
      'verification.isVerified': true
    })
    .populate('owner', 'name email phone')
    .populate('agent', 'name email phone')
    .sort({ views: -1, createdAt: -1 })
    .limit(6);

    res.json({
      error: false,
      data: { properties: featuredProperties }
    });

  } catch (error) {
    console.error('Featured properties error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching featured properties'
    });
  }
});

module.exports = router; 