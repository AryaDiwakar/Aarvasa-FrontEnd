const mongoose = require('mongoose');

const propertySchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, 'Property title is required'],
    trim: true,
    maxlength: [100, 'Title cannot exceed 100 characters']
  },
  description: {
    type: String,
    required: [true, 'Property description is required'],
    maxlength: [1000, 'Description cannot exceed 1000 characters']
  },
  type: {
    type: String,
    required: [true, 'Property type is required'],
    enum: ['apartment', 'house', 'villa', 'commercial', 'land', 'office']
  },
  category: {
    type: String,
    required: [true, 'Property category is required'],
    enum: ['residential', 'commercial', 'industrial', 'agricultural']
  },
  purpose: {
    type: String,
    required: [true, 'Property purpose is required'],
    enum: ['sale', 'rent']
  },
  price: {
    type: Number,
    required: [true, 'Property price is required'],
    min: [0, 'Price cannot be negative']
  },
  priceType: {
    type: String,
    enum: ['monthly', 'yearly', 'total'],
    default: 'total'
  },
  currency: {
    type: String,
    default: 'INR'
  },
  location: {
    address: {
      type: String,
      required: [true, 'Address is required']
    },
    city: {
      type: String,
      required: [true, 'City is required']
    },
    state: {
      type: String,
      required: [true, 'State is required']
    },
    country: {
      type: String,
      default: 'India'
    },
    coordinates: {
      latitude: Number,
      longitude: Number
    },
    locality: String,
    pincode: String
  },
  specifications: {
    bedrooms: {
      type: Number,
      min: [0, 'Bedrooms cannot be negative']
    },
    bathrooms: {
      type: Number,
      min: [0, 'Bathrooms cannot be negative']
    },
    area: {
      size: {
        type: Number,
        required: [true, 'Property area is required']
      },
      unit: {
        type: String,
        enum: ['sqft', 'sqm', 'acres', 'hectares'],
        default: 'sqft'
      }
    },
    floors: {
      type: Number,
      min: [1, 'Floors must be at least 1']
    },
    parking: {
      type: Number,
      min: [0, 'Parking spaces cannot be negative']
    },
    furnishing: {
      type: String,
      enum: ['furnished', 'semi-furnished', 'unfurnished'],
      default: 'unfurnished'
    }
  },
  amenities: [{
    type: String,
    enum: [
      'gym', 'pool', 'garden', 'parking', 'security', 'elevator',
      'ac', 'heating', 'internet', 'cable', 'balcony', 'terrace',
      'playground', 'clubhouse', 'maintenance', 'power_backup'
    ]
  }],
  images: [{
    url: {
      type: String,
      required: true
    },
    caption: String,
    isPrimary: {
      type: Boolean,
      default: false
    }
  }],
  documents: [{
    name: String,
    url: String,
    type: String
  }],
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  agent: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User'
  },
  status: {
    type: String,
    enum: ['available', 'sold', 'rented', 'under_contract', 'inactive'],
    default: 'available'
  },
  verification: {
    isVerified: {
      type: Boolean,
      default: false
    },
    verifiedBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User'
    },
    verifiedAt: Date
  },
  views: {
    type: Number,
    default: 0
  },
  favorites: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User'
  }],
  tags: [String],
  highlights: [String],
  nearbyPlaces: [{
    name: String,
    type: String,
    distance: Number
  }]
}, {
  timestamps: true
});

// Indexes for better query performance
propertySchema.index({ 'location.city': 1, 'location.state': 1 });
propertySchema.index({ price: 1 });
propertySchema.index({ type: 1, category: 1 });
propertySchema.index({ status: 1 });
propertySchema.index({ 'specifications.bedrooms': 1 });
propertySchema.index({ createdAt: -1 });

// Virtual for price per sqft
propertySchema.virtual('pricePerSqft').get(function() {
  if (this.specifications.area && this.specifications.area.size > 0) {
    return this.price / this.specifications.area.size;
  }
  return null;
});

// Ensure virtual fields are serialized
propertySchema.set('toJSON', { virtuals: true });
propertySchema.set('toObject', { virtuals: true });

module.exports = mongoose.model('Property', propertySchema); 