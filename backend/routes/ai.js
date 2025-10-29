const express = require('express');
const { body, validationResult } = require('express-validator');
const OpenAI = require('openai');
const Property = require('../models/Property');

const router = express.Router();

// Initialize OpenAI
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

// @route   POST /api/ai/chat
// @desc    Chat with AI assistant
// @access  Public
router.post('/chat', [
  body('message').notEmpty().withMessage('Message is required'),
  body('conversationHistory').optional().isArray()
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

    const { message, conversationHistory = [] } = req.body;

    // Build conversation context
    const messages = [
      {
        role: 'system',
        content: `You are Aarvasa AI, a helpful real estate assistant. You help users find properties, understand market trends, and provide real estate advice. 

Key capabilities:
- Property search and recommendations
- Market analysis and price trends
- Real estate investment advice
- Property valuation insights
- Location analysis
- Legal and documentation guidance

Always be helpful, professional, and provide accurate information. If you don't know something, say so rather than guessing.`
      },
      ...conversationHistory.map(msg => ({
        role: msg.isUser ? 'user' : 'assistant',
        content: msg.text
      })),
      {
        role: 'user',
        content: message
      }
    ];

    // Get AI response
    const completion = await openai.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages,
      max_tokens: 500,
      temperature: 0.7,
    });

    const aiResponse = completion.choices[0].message.content;

    res.json({
      error: false,
      data: {
        message: aiResponse,
        timestamp: new Date().toISOString()
      }
    });

  } catch (error) {
    console.error('AI chat error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while processing AI chat'
    });
  }
});

// @route   POST /api/ai/property-recommendations
// @desc    Get AI-powered property recommendations
// @access  Public
router.post('/property-recommendations', [
  body('preferences').isObject().withMessage('Preferences object is required'),
  body('budget').optional().isObject(),
  body('location').optional().isString(),
  body('propertyType').optional().isString()
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

    const { preferences, budget, location, propertyType } = req.body;

    // Build filter based on preferences
    const filter = { status: 'available' };
    
    if (propertyType) filter.type = propertyType;
    if (location) filter['location.city'] = new RegExp(location, 'i');
    if (budget) {
      filter.price = {};
      if (budget.min) filter.price.$gte = budget.min;
      if (budget.max) filter.price.$lte = budget.max;
    }
    if (preferences.bedrooms) filter['specifications.bedrooms'] = { $gte: preferences.bedrooms };
    if (preferences.bathrooms) filter['specifications.bathrooms'] = { $gte: preferences.bathrooms };

    // Get properties
    const properties = await Property.find(filter)
      .populate('owner', 'name email phone')
      .populate('agent', 'name email phone')
      .sort({ 'verification.isVerified': -1, views: -1 })
      .limit(10);

    // Generate AI analysis
    const analysisPrompt = `
      Analyze these ${properties.length} properties for a user with preferences: ${JSON.stringify(preferences)}
      
      Properties:
      ${properties.map(p => `
        - ${p.title} in ${p.location.city}
        - Price: ${p.currency} ${p.price} (${p.priceType})
        - ${p.specifications.bedrooms} beds, ${p.specifications.bathrooms} baths
        - ${p.specifications.area.size} ${p.specifications.area.unit}
        - ${p.amenities.length} amenities
      `).join('\n')}
      
      Provide:
      1. Top 3 recommendations with reasons
      2. Market insights for these properties
      3. Investment potential analysis
      4. Any red flags or concerns
    `;

    const completion = await openai.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages: [{ role: 'user', content: analysisPrompt }],
      max_tokens: 800,
      temperature: 0.7,
    });

    const analysis = completion.choices[0].message.content;

    res.json({
      error: false,
      data: {
        properties,
        analysis,
        totalFound: properties.length
      }
    });

  } catch (error) {
    console.error('Property recommendations error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while generating recommendations'
    });
  }
});

// @route   POST /api/ai/market-analysis
// @desc    Get AI-powered market analysis
// @access  Public
router.post('/market-analysis', [
  body('location').notEmpty().withMessage('Location is required'),
  body('propertyType').optional().isString(),
  body('timeframe').optional().isIn(['3months', '6months', '1year', '2years'])
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

    const { location, propertyType, timeframe = '1year' } = req.body;

    // Get market data
    const filter = { 
      status: 'available',
      'location.city': new RegExp(location, 'i')
    };
    
    if (propertyType) filter.type = propertyType;

    const properties = await Property.find(filter)
      .select('price specifications.area.size createdAt')
      .sort({ createdAt: -1 })
      .limit(100);

    // Calculate market statistics
    const prices = properties.map(p => p.price);
    const avgPrice = prices.reduce((a, b) => a + b, 0) / prices.length;
    const minPrice = Math.min(...prices);
    const maxPrice = Math.max(...prices);

    const areas = properties.map(p => p.specifications.area.size);
    const avgArea = areas.reduce((a, b) => a + b, 0) / areas.length;
    const avgPricePerSqft = avgPrice / avgArea;

    // Generate AI analysis
    const analysisPrompt = `
      Provide a comprehensive market analysis for ${location} real estate market.
      
      Market Statistics:
      - Average Price: ${avgPrice.toLocaleString()}
      - Price Range: ${minPrice.toLocaleString()} - ${maxPrice.toLocaleString()}
      - Average Area: ${avgArea.toFixed(2)} sqft
      - Average Price per sqft: ${avgPricePerSqft.toFixed(2)}
      - Total Properties Analyzed: ${properties.length}
      - Timeframe: ${timeframe}
      
      Please provide:
      1. Market trends and insights
      2. Price analysis and predictions
      3. Investment opportunities
      4. Risk factors
      5. Recommendations for buyers/sellers
    `;

    const completion = await openai.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages: [{ role: 'user', content: analysisPrompt }],
      max_tokens: 1000,
      temperature: 0.7,
    });

    const analysis = completion.choices[0].message.content;

    res.json({
      error: false,
      data: {
        location,
        timeframe,
        statistics: {
          averagePrice: avgPrice,
          priceRange: { min: minPrice, max: maxPrice },
          averageArea: avgArea,
          averagePricePerSqft: avgPricePerSqft,
          totalProperties: properties.length
        },
        analysis
      }
    });

  } catch (error) {
    console.error('Market analysis error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while generating market analysis'
    });
  }
});

// @route   POST /api/ai/property-valuation
// @desc    Get AI-powered property valuation
// @access  Public
router.post('/property-valuation', [
  body('propertyDetails').isObject().withMessage('Property details are required'),
  body('location').notEmpty().withMessage('Location is required')
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

    const { propertyDetails, location } = req.body;

    // Get comparable properties
    const comparableProperties = await Property.find({
      status: 'available',
      'location.city': new RegExp(location, 'i'),
      type: propertyDetails.type,
      'specifications.bedrooms': propertyDetails.bedrooms,
      'specifications.area.size': {
        $gte: propertyDetails.area * 0.8,
        $lte: propertyDetails.area * 1.2
      }
    })
    .select('price specifications.area.size specifications.bedrooms specifications.bathrooms')
    .limit(10);

    // Calculate valuation
    const comparablePrices = comparableProperties.map(p => p.price);
    const avgComparablePrice = comparablePrices.reduce((a, b) => a + b, 0) / comparablePrices.length;
    
    // Adjust for property features
    let valuation = avgComparablePrice;
    if (propertyDetails.bathrooms > 2) valuation *= 1.1;
    if (propertyDetails.furnishing === 'furnished') valuation *= 1.15;
    if (propertyDetails.amenities && propertyDetails.amenities.length > 5) valuation *= 1.05;

    // Generate AI valuation report
    const valuationPrompt = `
      Provide a detailed property valuation report for:
      
      Property Details:
      - Type: ${propertyDetails.type}
      - Bedrooms: ${propertyDetails.bedrooms}
      - Bathrooms: ${propertyDetails.bathrooms}
      - Area: ${propertyDetails.area} sqft
      - Location: ${location}
      - Furnishing: ${propertyDetails.furnishing || 'Not specified'}
      
      Comparable Analysis:
      - Average comparable price: ${avgComparablePrice.toLocaleString()}
      - Number of comparables: ${comparableProperties.length}
      - Calculated valuation: ${valuation.toLocaleString()}
      
      Please provide:
      1. Detailed valuation breakdown
      2. Factors affecting the price
      3. Market positioning
      4. Investment potential
      5. Recommendations for pricing strategy
    `;

    const completion = await openai.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages: [{ role: 'user', content: valuationPrompt }],
      max_tokens: 800,
      temperature: 0.7,
    });

    const valuationReport = completion.choices[0].message.content;

    res.json({
      error: false,
      data: {
        propertyDetails,
        location,
        valuation: {
          estimatedValue: valuation,
          comparableCount: comparableProperties.length,
          averageComparablePrice: avgComparablePrice,
          priceRange: {
            min: Math.min(...comparablePrices),
            max: Math.max(...comparablePrices)
          }
        },
        report: valuationReport
      }
    });

  } catch (error) {
    console.error('Property valuation error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while generating valuation'
    });
  }
});

module.exports = router; 