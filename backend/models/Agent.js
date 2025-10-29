const mongoose = require('mongoose');

const agentSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true,
    unique: true
  },
  licenseNumber: {
    type: String,
    required: [true, 'License number is required'],
    unique: true
  },
  specialization: [{
    type: String,
    enum: ['residential', 'commercial', 'luxury', 'investment', 'rental', 'new_construction']
  }],
  experience: {
    years: {
      type: Number,
      min: [0, 'Experience years cannot be negative']
    },
    description: String
  },
  company: {
    name: String,
    address: String,
    phone: String,
    website: String
  },
  certifications: [{
    name: String,
    issuingAuthority: String,
    issueDate: Date,
    expiryDate: Date
  }],
  languages: [String],
  serviceAreas: [{
    city: String,
    state: String,
    localities: [String]
  }],
  achievements: [{
    title: String,
    description: String,
    year: Number
  }],
  ratings: {
    average: {
      type: Number,
      default: 0,
      min: 0,
      max: 5
    },
    totalReviews: {
      type: Number,
      default: 0
    },
    reviews: [{
      user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
      },
      rating: {
        type: Number,
        required: true,
        min: 1,
        max: 5
      },
      comment: String,
      createdAt: {
        type: Date,
        default: Date.now
      }
    }]
  },
  properties: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Property'
  }],
  deals: {
    total: {
      type: Number,
      default: 0
    },
    completed: {
      type: Number,
      default: 0
    },
    inProgress: {
      type: Number,
      default: 0
    }
  },
  availability: {
    isAvailable: {
      type: Boolean,
      default: true
    },
    schedule: {
      monday: { start: String, end: String },
      tuesday: { start: String, end: String },
      wednesday: { start: String, end: String },
      thursday: { start: String, end: String },
      friday: { start: String, end: String },
      saturday: { start: String, end: String },
      sunday: { start: String, end: String }
    }
  },
  contactInfo: {
    phone: String,
    whatsapp: String,
    email: String,
    website: String,
    socialMedia: {
      linkedin: String,
      facebook: String,
      instagram: String
    }
  },
  isVerified: {
    type: Boolean,
    default: false
  },
  isActive: {
    type: Boolean,
    default: true
  }
}, {
  timestamps: true
});

// Indexes
agentSchema.index({ 'serviceAreas.city': 1, 'serviceAreas.state': 1 });
agentSchema.index({ 'ratings.average': -1 });
agentSchema.index({ specialization: 1 });
agentSchema.index({ isVerified: 1, isActive: 1 });

// Virtual for success rate
agentSchema.virtual('successRate').get(function() {
  if (this.deals.total === 0) return 0;
  return (this.deals.completed / this.deals.total) * 100;
});

// Ensure virtual fields are serialized
agentSchema.set('toJSON', { virtuals: true });
agentSchema.set('toObject', { virtuals: true });

module.exports = mongoose.model('Agent', agentSchema); 