const express = require('express');
const { body, validationResult, query } = require('express-validator');
const Agent = require('../models/Agent');
const User = require('../models/User');
const Property = require('../models/Property');

const router = express.Router();

// @route   GET /api/agents
// @desc    Get all agents with filtering
// @access  Public
router.get('/', [
  query('city').optional().isString(),
  query('specialization').optional().isString(),
  query('rating').optional().isFloat({ min: 0, max: 5 }),
  query('page').optional().isInt({ min: 1 }),
  query('limit').optional().isInt({ min: 1, max: 50 })
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
      city,
      specialization,
      rating,
      page = 1,
      limit = 10
    } = req.query;

    // Build filter
    const filter = { isActive: true };
    if (city) filter['serviceAreas.city'] = new RegExp(city, 'i');
    if (specialization) filter.specialization = specialization;
    if (rating) filter['ratings.average'] = { $gte: parseFloat(rating) };

    const skip = (parseInt(page) - 1) * parseInt(limit);

    const agents = await Agent.find(filter)
      .populate('user', 'name email phone profileImage')
      .sort({ 'ratings.average': -1, 'deals.completed': -1 })
      .skip(skip)
      .limit(parseInt(limit));

    const total = await Agent.countDocuments(filter);

    res.json({
      error: false,
      data: {
        agents,
        pagination: {
          currentPage: parseInt(page),
          totalPages: Math.ceil(total / parseInt(limit)),
          totalItems: total,
          itemsPerPage: parseInt(limit)
        }
      }
    });

  } catch (error) {
    console.error('Get agents error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching agents'
    });
  }
});

// @route   GET /api/agents/:id
// @desc    Get agent by ID
// @access  Public
router.get('/:id', async (req, res) => {
  try {
    const agent = await Agent.findById(req.params.id)
      .populate('user', 'name email phone profileImage')
      .populate({
        path: 'properties',
        populate: [
          { path: 'owner', select: 'name email phone' }
        ]
      });

    if (!agent) {
      return res.status(404).json({
        error: true,
        message: 'Agent not found'
      });
    }

    res.json({
      error: false,
      data: { agent }
    });

  } catch (error) {
    console.error('Get agent error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching agent'
    });
  }
});

// @route   POST /api/agents
// @desc    Create new agent profile
// @access  Private
router.post('/', [
  body('licenseNumber').notEmpty().withMessage('License number is required'),
  body('specialization').isArray().withMessage('Specialization must be an array'),
  body('experience.years').isInt({ min: 0 }).withMessage('Experience years must be a positive number'),
  body('serviceAreas').isArray().withMessage('Service areas must be an array')
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

    // Check if user already has an agent profile
    const existingAgent = await Agent.findOne({ user: req.user.userId });
    if (existingAgent) {
      return res.status(400).json({
        error: true,
        message: 'Agent profile already exists for this user'
      });
    }

    const agentData = {
      ...req.body,
      user: req.user.userId
    };

    const agent = new Agent(agentData);
    await agent.save();

    // Update user role to agent
    await User.findByIdAndUpdate(req.user.userId, { role: 'agent' });

    const populatedAgent = await Agent.findById(agent._id)
      .populate('user', 'name email phone profileImage');

    res.status(201).json({
      error: false,
      message: 'Agent profile created successfully',
      data: { agent: populatedAgent }
    });

  } catch (error) {
    console.error('Create agent error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while creating agent profile'
    });
  }
});

// @route   PUT /api/agents/:id
// @desc    Update agent profile
// @access  Private
router.put('/:id', [
  body('specialization').optional().isArray(),
  body('experience.years').optional().isInt({ min: 0 }),
  body('serviceAreas').optional().isArray()
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

    const agent = await Agent.findById(req.params.id);
    if (!agent) {
      return res.status(404).json({
        error: true,
        message: 'Agent not found'
      });
    }

    // Check if user owns the agent profile
    if (agent.user.toString() !== req.user.userId) {
      return res.status(403).json({
        error: true,
        message: 'Not authorized to update this agent profile'
      });
    }

    // Update agent
    Object.assign(agent, req.body);
    await agent.save();

    const updatedAgent = await Agent.findById(agent._id)
      .populate('user', 'name email phone profileImage');

    res.json({
      error: false,
      message: 'Agent profile updated successfully',
      data: { agent: updatedAgent }
    });

  } catch (error) {
    console.error('Update agent error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while updating agent profile'
    });
  }
});

// @route   POST /api/agents/:id/review
// @desc    Add review to agent
// @access  Private
router.post('/:id/review', [
  body('rating').isInt({ min: 1, max: 5 }).withMessage('Rating must be between 1 and 5'),
  body('comment').optional().isString().isLength({ max: 500 })
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

    const { rating, comment } = req.body;

    const agent = await Agent.findById(req.params.id);
    if (!agent) {
      return res.status(404).json({
        error: true,
        message: 'Agent not found'
      });
    }

    // Check if user already reviewed this agent
    const existingReview = agent.ratings.reviews.find(
      review => review.user.toString() === req.user.userId
    );

    if (existingReview) {
      return res.status(400).json({
        error: true,
        message: 'You have already reviewed this agent'
      });
    }

    // Add review
    agent.ratings.reviews.push({
      user: req.user.userId,
      rating,
      comment
    });

    // Update average rating
    const totalRating = agent.ratings.reviews.reduce((sum, review) => sum + review.rating, 0);
    agent.ratings.average = totalRating / agent.ratings.reviews.length;
    agent.ratings.totalReviews = agent.ratings.reviews.length;

    await agent.save();

    res.json({
      error: false,
      message: 'Review added successfully',
      data: {
        averageRating: agent.ratings.average,
        totalReviews: agent.ratings.totalReviews
      }
    });

  } catch (error) {
    console.error('Add review error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while adding review'
    });
  }
});

// @route   GET /api/agents/top-rated
// @desc    Get top rated agents
// @access  Public
router.get('/top-rated', async (req, res) => {
  try {
    const topAgents = await Agent.find({
      isActive: true,
      'ratings.average': { $gte: 4.0 }
    })
    .populate('user', 'name email phone profileImage')
    .sort({ 'ratings.average': -1, 'deals.completed': -1 })
    .limit(10);

    res.json({
      error: false,
      data: { agents: topAgents }
    });

  } catch (error) {
    console.error('Get top agents error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching top agents'
    });
  }
});

// @route   GET /api/agents/search
// @desc    Search agents by location and specialization
// @access  Public
router.get('/search', async (req, res) => {
  try {
    const { q } = req.query;
    if (!q || q.length < 2) {
      return res.json({
        error: false,
        data: { agents: [] }
      });
    }

    const agents = await Agent.find({
      isActive: true,
      $or: [
        { 'serviceAreas.city': { $regex: q, $options: 'i' } },
        { 'serviceAreas.state': { $regex: q, $options: 'i' } },
        { specialization: { $regex: q, $options: 'i' } }
      ]
    })
    .populate('user', 'name email phone profileImage')
    .sort({ 'ratings.average': -1 })
    .limit(10);

    res.json({
      error: false,
      data: { agents }
    });

  } catch (error) {
    console.error('Search agents error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while searching agents'
    });
  }
});

module.exports = router; 