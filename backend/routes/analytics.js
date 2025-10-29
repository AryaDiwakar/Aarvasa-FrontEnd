const express = require('express');
const { query, validationResult } = require('express-validator');
const Property = require('../models/Property');
const User = require('../models/User');
const Agent = require('../models/Agent');

const router = express.Router();

// @route   GET /api/analytics/market-overview
// @desc    Get market overview statistics
// @access  Public
router.get('/market-overview', async (req, res) => {
  try {
    // Get total properties
    const totalProperties = await Property.countDocuments({ status: 'available' });
    
    // Get properties by type
    const propertiesByType = await Property.aggregate([
      { $match: { status: 'available' } },
      { $group: { _id: '$type', count: { $sum: 1 } } }
    ]);

    // Get properties by purpose
    const propertiesByPurpose = await Property.aggregate([
      { $match: { status: 'available' } },
      { $group: { _id: '$purpose', count: { $sum: 1 } } }
    ]);

    // Get average price
    const avgPriceResult = await Property.aggregate([
      { $match: { status: 'available' } },
      { $group: { _id: null, avgPrice: { $avg: '$price' } } }
    ]);

    // Get price range
    const priceRange = await Property.aggregate([
      { $match: { status: 'available' } },
      { $group: { 
        _id: null, 
        minPrice: { $min: '$price' }, 
        maxPrice: { $max: '$price' } 
      } }
    ]);

    // Get top cities
    const topCities = await Property.aggregate([
      { $match: { status: 'available' } },
      { $group: { _id: '$location.city', count: { $sum: 1 } } },
      { $sort: { count: -1 } },
      { $limit: 10 }
    ]);

    res.json({
      error: false,
      data: {
        totalProperties,
        propertiesByType,
        propertiesByPurpose,
        averagePrice: avgPriceResult[0]?.avgPrice || 0,
        priceRange: priceRange[0] || { minPrice: 0, maxPrice: 0 },
        topCities
      }
    });

  } catch (error) {
    console.error('Market overview error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching market overview'
    });
  }
});

// @route   GET /api/analytics/price-trends
// @desc    Get price trends by location and property type
// @access  Public
router.get('/price-trends', [
  query('city').optional().isString(),
  query('type').optional().isString(),
  query('timeframe').optional().isIn(['1month', '3months', '6months', '1year'])
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

    const { city, type, timeframe = '3months' } = req.query;

    // Calculate date range based on timeframe
    const now = new Date();
    let startDate;
    switch (timeframe) {
      case '1month':
        startDate = new Date(now.getFullYear(), now.getMonth() - 1, now.getDate());
        break;
      case '3months':
        startDate = new Date(now.getFullYear(), now.getMonth() - 3, now.getDate());
        break;
      case '6months':
        startDate = new Date(now.getFullYear(), now.getMonth() - 6, now.getDate());
        break;
      case '1year':
        startDate = new Date(now.getFullYear() - 1, now.getMonth(), now.getDate());
        break;
    }

    // Build filter
    const filter = {
      status: 'available',
      createdAt: { $gte: startDate }
    };

    if (city) filter['location.city'] = new RegExp(city, 'i');
    if (type) filter.type = type;

    // Get price trends by month
    const priceTrends = await Property.aggregate([
      { $match: filter },
      {
        $group: {
          _id: {
            year: { $year: '$createdAt' },
            month: { $month: '$createdAt' }
          },
          avgPrice: { $avg: '$price' },
          count: { $sum: 1 },
          minPrice: { $min: '$price' },
          maxPrice: { $max: '$price' }
        }
      },
      { $sort: { '_id.year': 1, '_id.month': 1 } }
    ]);

    // Get price trends by property type
    const priceByType = await Property.aggregate([
      { $match: filter },
      {
        $group: {
          _id: '$type',
          avgPrice: { $avg: '$price' },
          count: { $sum: 1 }
        }
      }
    ]);

    res.json({
      error: false,
      data: {
        timeframe,
        priceTrends,
        priceByType,
        filters: { city, type }
      }
    });

  } catch (error) {
    console.error('Price trends error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching price trends'
    });
  }
});

// @route   GET /api/analytics/location-insights
// @desc    Get location-based insights
// @access  Public
router.get('/location-insights', [
  query('city').optional().isString(),
  query('state').optional().isString()
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

    const { city, state } = req.query;

    // Build filter
    const filter = { status: 'available' };
    if (city) filter['location.city'] = new RegExp(city, 'i');
    if (state) filter['location.state'] = new RegExp(state, 'i');

    // Get location statistics
    const locationStats = await Property.aggregate([
      { $match: filter },
      {
        $group: {
          _id: {
            city: '$location.city',
            state: '$location.state'
          },
          avgPrice: { $avg: '$price' },
          count: { $sum: 1 },
          avgArea: { $avg: '$specifications.area.size' },
          avgBedrooms: { $avg: '$specifications.bedrooms' },
          avgBathrooms: { $avg: '$specifications.bathrooms' }
        }
      },
      { $sort: { count: -1 } }
    ]);

    // Get popular localities
    const popularLocalities = await Property.aggregate([
      { $match: filter },
      {
        $group: {
          _id: '$location.locality',
          count: { $sum: 1 },
          avgPrice: { $avg: '$price' }
        }
      },
      { $sort: { count: -1 } },
      { $limit: 10 }
    ]);

    // Get property types by location
    const propertyTypesByLocation = await Property.aggregate([
      { $match: filter },
      {
        $group: {
          _id: {
            city: '$location.city',
            type: '$type'
          },
          count: { $sum: 1 },
          avgPrice: { $avg: '$price' }
        }
      }
    ]);

    res.json({
      error: false,
      data: {
        locationStats,
        popularLocalities,
        propertyTypesByLocation,
        filters: { city, state }
      }
    });

  } catch (error) {
    console.error('Location insights error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching location insights'
    });
  }
});

// @route   GET /api/analytics/agent-performance
// @desc    Get agent performance analytics
// @access  Public
router.get('/agent-performance', async (req, res) => {
  try {
    // Get top performing agents
    const topAgents = await Agent.aggregate([
      { $match: { isActive: true } },
      {
        $lookup: {
          from: 'users',
          localField: 'user',
          foreignField: '_id',
          as: 'userInfo'
        }
      },
      { $unwind: '$userInfo' },
      {
        $project: {
          name: '$userInfo.name',
          email: '$userInfo.email',
          phone: '$userInfo.phone',
          rating: '$ratings.average',
          totalReviews: '$ratings.totalReviews',
          completedDeals: '$deals.completed',
          totalDeals: '$deals.total',
          successRate: {
            $cond: [
              { $eq: ['$deals.total', 0] },
              0,
              { $multiply: [{ $divide: ['$deals.completed', '$deals.total'] }, 100] }
            ]
          }
        }
      },
      { $sort: { rating: -1, completedDeals: -1 } },
      { $limit: 10 }
    ]);

    // Get agent statistics
    const agentStats = await Agent.aggregate([
      { $match: { isActive: true } },
      {
        $group: {
          _id: null,
          totalAgents: { $sum: 1 },
          avgRating: { $avg: '$ratings.average' },
          avgDealsCompleted: { $avg: '$deals.completed' },
          totalDealsCompleted: { $sum: '$deals.completed' }
        }
      }
    ]);

    // Get agents by specialization
    const agentsBySpecialization = await Agent.aggregate([
      { $match: { isActive: true } },
      { $unwind: '$specialization' },
      {
        $group: {
          _id: '$specialization',
          count: { $sum: 1 },
          avgRating: { $avg: '$ratings.average' }
        }
      }
    ]);

    res.json({
      error: false,
      data: {
        topAgents,
        agentStats: agentStats[0] || {},
        agentsBySpecialization
      }
    });

  } catch (error) {
    console.error('Agent performance error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching agent performance'
    });
  }
});

// @route   GET /api/analytics/user-activity
// @desc    Get user activity analytics
// @access  Private (Admin only)
router.get('/user-activity', async (req, res) => {
  try {
    // Check if user is admin
    if (req.user.role !== 'admin') {
      return res.status(403).json({
        error: true,
        message: 'Access denied. Admin only.'
      });
    }

    // Get user registration trends
    const registrationTrends = await User.aggregate([
      {
        $group: {
          _id: {
            year: { $year: '$createdAt' },
            month: { $month: '$createdAt' }
          },
          count: { $sum: 1 }
        }
      },
      { $sort: { '_id.year': 1, '_id.month': 1 } }
    ]);

    // Get user activity by role
    const usersByRole = await User.aggregate([
      {
        $group: {
          _id: '$role',
          count: { $sum: 1 },
          activeUsers: {
            $sum: { $cond: [{ $eq: ['$isActive', true] }, 1, 0] }
          }
        }
      }
    ]);

    // Get recent activity
    const recentActivity = await User.aggregate([
      { $sort: { lastLogin: -1 } },
      { $limit: 10 },
      {
        $project: {
          name: 1,
          email: 1,
          role: 1,
          lastLogin: 1,
          isActive: 1
        }
      }
    ]);

    res.json({
      error: false,
      data: {
        registrationTrends,
        usersByRole,
        recentActivity
      }
    });

  } catch (error) {
    console.error('User activity error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while fetching user activity'
    });
  }
});

module.exports = router; 