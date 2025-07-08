import 'package:flutter/material.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Apartment',
      'House',
      'Studio',
      'Villa',
      'Builder Floor',
    ];

    final List<String> images = [
      'assets/1.jpg',
      'assets/2.jpg',
      'assets/3.jpg',
      'assets/4.jpg',
      'assets/5.jpg',
    ];

    return Container(
      color: Colors.white, // White background for this section
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.black),
            ],
          ),
          const SizedBox(height: 12),

          // Horizontal list of cards
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(categories[index], images[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF7A004C), // Label background color
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
