import 'package:flutter/material.dart';

class BuildersSection extends StatelessWidget {
  const BuildersSection({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image paths
    final List<String> logos = [
      'assets/l1.png',
      'assets/l2.png',
      'assets/l3.png',
      'assets/l4.png',
    ];

    return Container(
      color: const Color(0xFF871747),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Builders',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                'See More',
                style: TextStyle(
                  color: Color(0xFFFFC727),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          // Logo Row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(logos.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      logos[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
