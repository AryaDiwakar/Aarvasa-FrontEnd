import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;

  const CustomInput({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: lightGrey,
        hintText: hintText,
        prefixIcon: Icon(icon, color: darkGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
