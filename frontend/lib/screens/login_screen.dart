import 'package:flutter/material.dart';
import '../widgets/custom_input.dart';
import '../widgets/rounded_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.50,
            width: double.infinity,
            child: Stack(
              children: [
                // Background image
                Image.asset(
                  'assets/login_bg.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),

                // Logo Positioned over bottom-left of image
                Positioned(
                  bottom: screenHeight * 0.25,
                  left: screenWidth * 0.12,
                  child: Image.asset(
                    'assets/aarvasa.png',
                    width: screenWidth * 0.32, // Adjust size as needed
                  ),
                ),
              ],
            ),
          ),

          // ✅ Bottom Curved White Section
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    const CustomInput(
                      icon: Icons.email_outlined,
                      hintText: "Enter Email id",
                    ),
                    const SizedBox(height: 16),

                    const CustomInput(
                      icon: Icons.lock_outline,
                      hintText: "Enter Password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    RoundedButton(
                      text: "Log In",
                      onPressed: () {
                        Navigator.pushNamed(context, '/buyRent'); // 👈 Onboarding flow starts here
                      },
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: Color(0xFF6E1B3A)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
