import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../screens/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back", style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: "Enter Email id",
            prefixIcon: const Icon(Icons.email_outlined),
            filled: true,
            fillColor: AppColors.inputFill,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter Password",
            prefixIcon: const Icon(Icons.lock_outline),
            filled: true,
            fillColor: AppColors.inputFill,
            suffixIcon: const Icon(Icons.visibility_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: Text("Forgot Password?", style: TextStyle(color: Colors.blue.shade700, fontSize: 12)),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Center(child: Text("Log In")),
        ),
        const SizedBox(height: 12),
        Center(
          child: GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen())),
            child: const Text.rich(
              TextSpan(text: "Don't have an account? ", children: [
                TextSpan(text: "Sign up", style: TextStyle(fontWeight: FontWeight.bold))
              ]),
            ),
          ),
        )
      ],
    );
  }
}
