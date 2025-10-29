const express = require('express');
const { body, validationResult } = require('express-validator');
const { sendEmail } = require('../utils/email');

const router = express.Router();

// @route   POST /api/contact/inquiry
// @desc    Submit contact inquiry
// @access  Public
router.post('/inquiry', [
  body('name').trim().isLength({ min: 2, max: 50 }).withMessage('Name must be between 2 and 50 characters'),
  body('email').isEmail().normalizeEmail().withMessage('Please provide a valid email'),
  body('phone').optional().matches(/^[0-9]{10}$/).withMessage('Please provide a valid 10-digit phone number'),
  body('subject').trim().isLength({ min: 5, max: 100 }).withMessage('Subject must be between 5 and 100 characters'),
  body('message').isLength({ min: 10, max: 1000 }).withMessage('Message must be between 10 and 1000 characters'),
  body('propertyId').optional().isMongoId().withMessage('Invalid property ID')
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

    const { name, email, phone, subject, message, propertyId } = req.body;

    // Send email to admin
    const adminEmailContent = `
      <h2>New Contact Inquiry</h2>
      <p><strong>Name:</strong> ${name}</p>
      <p><strong>Email:</strong> ${email}</p>
      ${phone ? `<p><strong>Phone:</strong> ${phone}</p>` : ''}
      <p><strong>Subject:</strong> ${subject}</p>
      <p><strong>Message:</strong></p>
      <p>${message}</p>
      ${propertyId ? `<p><strong>Property ID:</strong> ${propertyId}</p>` : ''}
      <p><strong>Date:</strong> ${new Date().toLocaleString()}</p>
    `;

    await sendEmail({
      to: process.env.EMAIL_USER,
      subject: `Contact Inquiry: ${subject}`,
      html: adminEmailContent
    });

    // Send confirmation email to user
    const userEmailContent = `
      <h2>Thank you for contacting Aarvasa!</h2>
      <p>Dear ${name},</p>
      <p>We have received your inquiry and will get back to you within 24 hours.</p>
      <p><strong>Your message:</strong></p>
      <p>${message}</p>
      <p>Best regards,<br>The Aarvasa Team</p>
    `;

    await sendEmail({
      to: email,
      subject: 'Thank you for contacting Aarvasa',
      html: userEmailContent
    });

    res.json({
      error: false,
      message: 'Inquiry submitted successfully. We will get back to you soon.'
    });

  } catch (error) {
    console.error('Contact inquiry error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while submitting inquiry'
    });
  }
});

// @route   POST /api/contact/property-inquiry
// @desc    Submit property-specific inquiry
// @access  Public
router.post('/property-inquiry', [
  body('name').trim().isLength({ min: 2, max: 50 }).withMessage('Name must be between 2 and 50 characters'),
  body('email').isEmail().normalizeEmail().withMessage('Please provide a valid email'),
  body('phone').optional().matches(/^[0-9]{10}$/).withMessage('Please provide a valid 10-digit phone number'),
  body('propertyId').isMongoId().withMessage('Property ID is required'),
  body('message').optional().isLength({ max: 1000 }).withMessage('Message cannot exceed 1000 characters'),
  body('inquiryType').isIn(['viewing', 'price', 'details', 'other']).withMessage('Invalid inquiry type')
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

    const { name, email, phone, propertyId, message, inquiryType } = req.body;

    // Send email to property owner/agent
    const inquiryEmailContent = `
      <h2>Property Inquiry</h2>
      <p><strong>Inquiry Type:</strong> ${inquiryType}</p>
      <p><strong>From:</strong> ${name}</p>
      <p><strong>Email:</strong> ${email}</p>
      ${phone ? `<p><strong>Phone:</strong> ${phone}</p>` : ''}
      ${message ? `<p><strong>Message:</strong> ${message}</p>` : ''}
      <p><strong>Property ID:</strong> ${propertyId}</p>
      <p><strong>Date:</strong> ${new Date().toLocaleString()}</p>
    `;

    await sendEmail({
      to: process.env.EMAIL_USER,
      subject: `Property Inquiry: ${inquiryType}`,
      html: inquiryEmailContent
    });

    // Send confirmation email to user
    const userEmailContent = `
      <h2>Property Inquiry Submitted</h2>
      <p>Dear ${name},</p>
      <p>Thank you for your interest in our property. We have forwarded your inquiry to the property owner/agent.</p>
      <p>You will receive a response within 24 hours.</p>
      <p><strong>Inquiry Details:</strong></p>
      <p>Type: ${inquiryType}</p>
      <p>Property ID: ${propertyId}</p>
      ${message ? `<p>Your Message: ${message}</p>` : ''}
      <p>Best regards,<br>The Aarvasa Team</p>
    `;

    await sendEmail({
      to: email,
      subject: 'Property Inquiry Submitted - Aarvasa',
      html: userEmailContent
    });

    res.json({
      error: false,
      message: 'Property inquiry submitted successfully. We will get back to you soon.'
    });

  } catch (error) {
    console.error('Property inquiry error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while submitting property inquiry'
    });
  }
});

// @route   POST /api/contact/agent-inquiry
// @desc    Submit agent inquiry
// @access  Public
router.post('/agent-inquiry', [
  body('name').trim().isLength({ min: 2, max: 50 }).withMessage('Name must be between 2 and 50 characters'),
  body('email').isEmail().normalizeEmail().withMessage('Please provide a valid email'),
  body('phone').optional().matches(/^[0-9]{10}$/).withMessage('Please provide a valid 10-digit phone number'),
  body('agentId').isMongoId().withMessage('Agent ID is required'),
  body('message').optional().isLength({ max: 1000 }).withMessage('Message cannot exceed 1000 characters'),
  body('inquiryType').isIn(['consultation', 'property', 'partnership', 'other']).withMessage('Invalid inquiry type')
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

    const { name, email, phone, agentId, message, inquiryType } = req.body;

    // Send email to agent
    const agentEmailContent = `
      <h2>Agent Inquiry</h2>
      <p><strong>Inquiry Type:</strong> ${inquiryType}</p>
      <p><strong>From:</strong> ${name}</p>
      <p><strong>Email:</strong> ${email}</p>
      ${phone ? `<p><strong>Phone:</strong> ${phone}</p>` : ''}
      ${message ? `<p><strong>Message:</strong> ${message}</p>` : ''}
      <p><strong>Agent ID:</strong> ${agentId}</p>
      <p><strong>Date:</strong> ${new Date().toLocaleString()}</p>
    `;

    await sendEmail({
      to: process.env.EMAIL_USER,
      subject: `Agent Inquiry: ${inquiryType}`,
      html: agentEmailContent
    });

    // Send confirmation email to user
    const userEmailContent = `
      <h2>Agent Inquiry Submitted</h2>
      <p>Dear ${name},</p>
      <p>Thank you for contacting our agent. Your inquiry has been forwarded and you will receive a response within 24 hours.</p>
      <p><strong>Inquiry Details:</strong></p>
      <p>Type: ${inquiryType}</p>
      <p>Agent ID: ${agentId}</p>
      ${message ? `<p>Your Message: ${message}</p>` : ''}
      <p>Best regards,<br>The Aarvasa Team</p>
    `;

    await sendEmail({
      to: email,
      subject: 'Agent Inquiry Submitted - Aarvasa',
      html: userEmailContent
    });

    res.json({
      error: false,
      message: 'Agent inquiry submitted successfully. We will get back to you soon.'
    });

  } catch (error) {
    console.error('Agent inquiry error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while submitting agent inquiry'
    });
  }
});

// @route   POST /api/contact/feedback
// @desc    Submit feedback
// @access  Public
router.post('/feedback', [
  body('name').trim().isLength({ min: 2, max: 50 }).withMessage('Name must be between 2 and 50 characters'),
  body('email').isEmail().normalizeEmail().withMessage('Please provide a valid email'),
  body('rating').isInt({ min: 1, max: 5 }).withMessage('Rating must be between 1 and 5'),
  body('category').isIn(['website', 'service', 'property', 'agent', 'other']).withMessage('Invalid feedback category'),
  body('message').isLength({ min: 10, max: 1000 }).withMessage('Message must be between 10 and 1000 characters')
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

    const { name, email, rating, category, message } = req.body;

    // Send feedback email
    const feedbackEmailContent = `
      <h2>User Feedback</h2>
      <p><strong>From:</strong> ${name}</p>
      <p><strong>Email:</strong> ${email}</p>
      <p><strong>Rating:</strong> ${rating}/5</p>
      <p><strong>Category:</strong> ${category}</p>
      <p><strong>Message:</strong></p>
      <p>${message}</p>
      <p><strong>Date:</strong> ${new Date().toLocaleString()}</p>
    `;

    await sendEmail({
      to: process.env.EMAIL_USER,
      subject: `User Feedback: ${rating}/5 - ${category}`,
      html: feedbackEmailContent
    });

    // Send thank you email to user
    const thankYouEmailContent = `
      <h2>Thank you for your feedback!</h2>
      <p>Dear ${name},</p>
      <p>Thank you for taking the time to provide feedback about Aarvasa. Your input helps us improve our services.</p>
      <p>We appreciate your rating of ${rating}/5 for our ${category}.</p>
      <p>Best regards,<br>The Aarvasa Team</p>
    `;

    await sendEmail({
      to: email,
      subject: 'Thank you for your feedback - Aarvasa',
      html: thankYouEmailContent
    });

    res.json({
      error: false,
      message: 'Feedback submitted successfully. Thank you for your input!'
    });

  } catch (error) {
    console.error('Feedback error:', error);
    res.status(500).json({
      error: true,
      message: 'Server error while submitting feedback'
    });
  }
});

module.exports = router; 