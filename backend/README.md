# Aarvasa Backend API

A comprehensive Node.js/Express backend API for the Aarvasa real estate application.

## 🚀 Features

- **User Authentication & Authorization**
  - JWT-based authentication
  - User registration and login
  - Password reset with OTP
  - Role-based access control

- **Property Management**
  - CRUD operations for properties
  - Advanced search and filtering
  - Property favorites system
  - Image upload with Cloudinary

- **Agent Management**
  - Agent profiles and ratings
  - Agent search and filtering
  - Performance analytics
  - Review system

- **AI Integration**
  - OpenAI-powered chat assistant
  - Property recommendations
  - Market analysis
  - Property valuation

- **Analytics & Insights**
  - Market trends and statistics
  - Price analysis
  - Location insights
  - User activity tracking

- **Contact & Communication**
  - Contact forms
  - Property inquiries
  - Email notifications
  - Feedback system

## 📋 Prerequisites

- Node.js (v16 or higher)
- MongoDB (v4.4 or higher)
- npm or yarn

## 🛠️ Installation

1. **Clone the repository**
   ```bash
   cd backend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Environment Setup**
   - Copy `config.env` to `.env`
   - Update the environment variables with your values

4. **Database Setup**
   - Ensure MongoDB is running
   - The API will automatically create the database on first run

5. **Start the server**
   ```bash
   # Development
   npm run dev
   
   # Production
   npm start
   ```

## 🔧 Environment Variables

Create a `.env` file with the following variables:

```env
# Server Configuration
PORT=5000
NODE_ENV=development

# Database
MONGODB_URI=mongodb://localhost:27017/aarvasa_db

# JWT Secret
JWT_SECRET=your-super-secret-jwt-key-change-in-production

# Cloudinary Configuration
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret

# OpenAI Configuration
OPENAI_API_KEY=your-openai-api-key

# Email Configuration (Gmail)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your-email@gmail.com
EMAIL_PASS=your-app-password

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# File Upload
MAX_FILE_SIZE=5242880
```

## 📚 API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/forgot-password` - Send password reset email
- `POST /api/auth/reset-password` - Reset password with OTP
- `GET /api/auth/me` - Get current user profile
- `PUT /api/auth/update-profile` - Update user profile

### Properties
- `GET /api/properties` - Get all properties with filtering
- `GET /api/properties/:id` - Get property by ID
- `POST /api/properties` - Create new property
- `PUT /api/properties/:id` - Update property
- `DELETE /api/properties/:id` - Delete property
- `POST /api/properties/:id/favorite` - Toggle favorite property
- `GET /api/properties/search/suggestions` - Get search suggestions
- `GET /api/properties/featured` - Get featured properties

### Users
- `GET /api/users/profile` - Get user profile
- `PUT /api/users/profile` - Update user profile
- `GET /api/users/favorites` - Get user favorites
- `POST /api/users/favorites/:propertyId` - Add to favorites
- `DELETE /api/users/favorites/:propertyId` - Remove from favorites
- `GET /api/users/recent-searches` - Get recent searches
- `GET /api/users/activity` - Get user activity

### Agents
- `GET /api/agents` - Get all agents with filtering
- `GET /api/agents/:id` - Get agent by ID
- `POST /api/agents` - Create agent profile
- `PUT /api/agents/:id` - Update agent profile
- `POST /api/agents/:id/review` - Add review to agent
- `GET /api/agents/top-rated` - Get top rated agents
- `GET /api/agents/search` - Search agents

### AI Services
- `POST /api/ai/chat` - Chat with AI assistant
- `POST /api/ai/property-recommendations` - Get AI recommendations
- `POST /api/ai/market-analysis` - Get market analysis
- `POST /api/ai/property-valuation` - Get property valuation

### Contact
- `POST /api/contact/inquiry` - Submit contact inquiry
- `POST /api/contact/property-inquiry` - Submit property inquiry
- `POST /api/contact/agent-inquiry` - Submit agent inquiry
- `POST /api/contact/feedback` - Submit feedback

### Analytics
- `GET /api/analytics/market-overview` - Get market overview
- `GET /api/analytics/price-trends` - Get price trends
- `GET /api/analytics/location-insights` - Get location insights
- `GET /api/analytics/agent-performance` - Get agent performance
- `GET /api/analytics/user-activity` - Get user activity (Admin only)

## 🔐 Authentication

Most endpoints require authentication. Include the JWT token in the Authorization header:

```
Authorization: Bearer <your-jwt-token>
```

## 📊 Database Models

### User
- Basic user information
- Authentication details
- Preferences and favorites
- Role-based access

### Property
- Property details and specifications
- Location information
- Pricing and status
- Images and documents
- Owner and agent references

### Agent
- Agent profile information
- Specializations and experience
- Ratings and reviews
- Performance metrics

## 🚀 Deployment

### Local Development
```bash
npm run dev
```

### Production
```bash
npm start
```

### Docker (Optional)
```bash
docker build -t aarvasa-backend .
docker run -p 5000:5000 aarvasa-backend
```

## 🧪 Testing

```bash
npm test
```

## 📝 API Documentation

The API follows RESTful conventions and returns JSON responses in the following format:

### Success Response
```json
{
  "error": false,
  "message": "Operation successful",
  "data": {
    // Response data
  }
}
```

### Error Response
```json
{
  "error": true,
  "message": "Error description",
  "errors": [
    // Validation errors (if any)
  ]
}
```

## 🔒 Security Features

- JWT authentication
- Password hashing with bcrypt
- Rate limiting
- Input validation
- CORS protection
- Helmet security headers
- Request compression

## 📈 Performance

- Database indexing for optimal queries
- Response compression
- Image optimization with Cloudinary
- Caching strategies (can be implemented)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For support, email support@aarvasa.com or create an issue in the repository.

---

**Aarvasa Backend API** - Powering the future of real estate technology. 