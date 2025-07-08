import 'package:flutter/material.dart';

class BackgroundWrap extends StatelessWidget {
  final Widget child;

  const BackgroundWrap({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              Image.asset(
                'assets/login_bg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: screenHeight * 0.26, // Adjust as needed
                left: screenWidth * 0.14,
                child: Image.asset(
                  'assets/aarvasa.png',
                  width: screenWidth * 0.32,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: child,
        ),
      ],
    );
  }
}
