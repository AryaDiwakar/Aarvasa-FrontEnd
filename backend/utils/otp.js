// Generate OTP
const generateOTP = () => {
  return Math.floor(100000 + Math.random() * 900000).toString();
};

// Verify OTP
const verifyOTP = (inputOTP, storedOTP) => {
  return inputOTP === storedOTP;
};

// Check if OTP is expired
const isOTPExpired = (otpTimestamp, expiryMinutes = 10) => {
  const now = new Date();
  const otpTime = new Date(otpTimestamp);
  const diffInMinutes = (now - otpTime) / (1000 * 60);
  return diffInMinutes > expiryMinutes;
};

module.exports = {
  generateOTP,
  verifyOTP,
  isOTPExpired
}; 