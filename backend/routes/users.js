const express = require('express');
const { body, validationResult } = require('express-validator');
const User = require('../models/User');
const Property = require('../models/Property');

const router = express.Router();

// @route   GET /api/users/profile
// @desc    Get user profile
// @access  Private
router.get('/profile', async (req, res) => {
  try {
    const user = await User.findById(req.user.userId)
      .populate('favorites');

    if (!user) {
      return res.status(404).json({
        error: true,
        message: 'User not found'
      });
    }

    res.json({
      error: false,
      data: { user }
    });

  } catch (error) {
    console.error('Get profile error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching profile'
    });
  }
});

// @route   PUT /api/users/profile
// @desc    Update user profile
// @access  Private
router.put('/profile', [
  body('name').optional().trim().isLength({ min: 2, max: 50 }),
  body('phone').optional().matches(/^[0-9]{10}$/),
  body('preferences').optional().isObject()
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

    const { name, phone, preferences } = req.body;

    const user = await User.findById(req.user.userId);
    if (!user) {
      return res.status(404).json({
        error: true,
        message: 'User not found'
      });
    }

    // Update fields
    if (name) user.name = name;
    if (phone) user.phone = phone;
    if (preferences) user.preferences = { ...user.preferences, ...preferences };

    await user.save();

    res.json({
      error: false,
      message: 'Profile updated successfully',
      data: { user }
    });

  } catch (error) {
    console.error('Update profile error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while updating profile'
    });
  }
});

// @route   GET /api/users/favorites
// @desc    Get user favorites
// @access  Private
router.get('/favorites', async (req, res) => {
  try {
    const user = await User.findById(req.user.userId)
      .populate({
        path: 'favorites',
        populate: [
          { path: 'owner', select: 'name email phone' },
          { path: 'agent', select: 'name email phone' }
        ]
      });

    if (!user) {
      return res.status(404).json({
        error: true,
        message: 'User not found'
      });
    }

    res.json({
      error: false,
      data: { favorites: user.favorites }
    });

  } catch (error) {
    console.error('Get favorites error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching favorites'
    });
  }
});

// @route   POST /api/users/favorites/:propertyId
// @desc    Add property to favorites
// @access  Private
router.post('/favorites/:propertyId', async (req, res) => {
  try {
    const property = await Property.findById(req.params.propertyId);
    if (!property) {
      return res.status(404).json({
        error: true,
        message: 'Property not found'
      });
    }

    const user = await User.findById(req.user.userId);
    if (!user) {
      return res.status(404).json({
        error: true,
        message: 'User not found'
      });
    }

    // Check if already in favorites
    if (user.favorites.includes(property._id)) {
      return res.status(400).json({
        error: true,
        message: 'Property already in favorites'
      });
    }

    // Add to favorites
    user.favorites.push(property._id);
    await user.save();

    res.json({
      error: false,
      message: 'Property added to favorites'
    });

  } catch (error) {
    console.error('Add to favorites error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while adding to favorites'
    });
  }
});

// @route   DELETE /api/users/favorites/:propertyId
// @desc    Remove property from favorites
// @access  Private
router.delete('/favorites/:propertyId', async (req, res) => {
  try {
    const user = await User.findById(req.user.userId);
    if (!user) {
      return res.status(404).json({
        error: true,
        message: 'User not found'
      });
    }

    // Remove from favorites
    user.favorites = user.favorites.filter(
      id => id.toString() !== req.params.propertyId
    );
    await user.save();

    res.json({
      error: false,
      message: 'Property removed from favorites'
    });

  } catch (error) {
    console.error('Remove from favorites error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while removing from favorites'
    });
  }
});

// @route   GET /api/users/recent-searches
// @desc    Get user recent searches
// @access  Private
router.get('/recent-searches', async (req, res) => {
  try {
    const user = await User.findById(req.user.userId);
    if (!user) {
      return res.status(404).json({
        error: true,
        message: 'User not found'
      });
    }

    // This would typically come from a separate SearchHistory model
    // For now, return empty array
    res.json({
      error: false,
      data: { searches: [] }
    });

  } catch (error) {
    console.error('Get recent searches error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching recent searches'
    });
  }
});

// @route   GET /api/users/activity
// @desc    Get user activity
// @access  Private
router.get('/activity', async (req, res) => {
  try {
    const user = await User.findById(req.user.userId);
    if (!user) {
      return res.status(404).json({
        error: true,
        message: 'User not found'
      });
    }

    // Get user's properties
    const userProperties = await Property.find({ owner: req.user.userId })
      .select('title price status createdAt')
      .sort({ createdAt: -1 })
      .limit(10);

    // Get user's favorite properties
    const favoriteProperties = await Property.find({
      _id: { $in: user.favorites }
    })
    .select('title price status createdAt')
    .sort({ createdAt: -1 })
    .limit(10);

    res.json({
      error: false,
      data: {
        userProperties,
        favoriteProperties,
        lastLogin: user.lastLogin,
        memberSince: user.createdAt
      }
    });

  } catch (error) {
    console.error('Get activity error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching activity'
    });
  }
});

module.exports = router; 