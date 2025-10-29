const nodemailer = require('nodemailer');

// Create transporter
const transporter = nodemailer.createTransport({
  host: process.env.EMAIL_HOST,
  port: process.env.EMAIL_PORT,
  secure: false, // true for 465, false for other ports
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS,
  },
});

// Send email function
const sendEmail = async ({ to, subject, html, text }) => {
  try {
    const mailOptions = {
      from: `"Aarvasa" <${process.env.EMAIL_USER}>`,
      to,
      subject,
      html,
      text
    };

    const info = await transporter.sendMail(mailOptions);
    console.log('Email sent:', info.messageId);
    return info;
  } catch (error) {
    console.error('Email sending error:', error);
    throw error;
  }
};

// Email templates
const emailTemplates = {
  welcome: (name) => ({
    subject: 'Welcome to Aarvasa!',
    html: `
      <h2>Welcome to Aarvasa!</h2>
      <p>Dear ${name},</p>
      <p>Thank you for joining Aarvasa, your trusted partner in real estate.</p>
      <p>We're excited to help you find your perfect property or list your property with us.</p>
      <p>Best regards,<br>The Aarvasa Team</p>
    `
  }),

  passwordReset: (name, otp) => ({
    subject: 'Password Reset - Aarvasa',
    html: `
      <h2>Password Reset Request</h2>
      <p>Hello ${name},</p>
      <p>You requested a password reset for your Aarvasa account.</p>
      <p>Your OTP is: <strong>${otp}</strong></p>
      <p>This OTP will expire in 10 minutes.</p>
      <p>If you didn't request this, please ignore this email.</p>
      <p>Best regards,<br>The Aarvasa Team</p>
    `
  }),

  propertyInquiry: (name, propertyTitle) => ({
    subject: 'Property Inquiry Submitted - Aarvasa',
    html: `
      <h2>Property Inquiry Submitted</h2>
      <p>Dear ${name},</p>
      <p>Thank you for your interest in our property: <strong>${propertyTitle}</strong></p>
      <p>We have forwarded your inquiry to the property owner/agent.</p>
      <p>You will receive a response within 24 hours.</p>
      <p>Best regards,<br>The Aarvasa Team</p>
    `
  }),

  contactConfirmation: (name) => ({
    subject: 'Thank you for contacting Aarvasa',
    html: `
      <h2>Thank you for contacting Aarvasa!</h2>
      <p>Dear ${name},</p>
      <p>We have received your inquiry and will get back to you within 24 hours.</p>
      <p>Best regards,<br>The Aarvasa Team</p>
    `
  })
};

module.exports = {
  sendEmail,
  emailTemplates
}; 