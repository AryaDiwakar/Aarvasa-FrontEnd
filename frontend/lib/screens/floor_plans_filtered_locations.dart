import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class FloorPlanDetailPage extends StatelessWidget {
  const FloorPlanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 2; // Set your active tab index here

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          // Handle bottom nav tap
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 8),
                  Text(
                    'Floor Plans',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Floor Plan Image
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/p3.png'), // Use actual image path
              ),
              const SizedBox(height: 16),

              // Toggle Buttons
              Row(
                children: [
                  _buildToggleButton('3D Live', false),
                  _buildToggleButton('3D Image', false),
                  _buildToggleButton('2D Image', true),
                ],
              ),
              const SizedBox(height: 20),

              // Property Title
              const Text(
                '1 Bedroom Apartments unit 1/Floors\n2-3 Floor plan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),

              // Property Info
              Row(
                children: const [
                  Text('Apartment'),
                  SizedBox(width: 16),
                  Icon(Icons.bed, size: 18),
                  SizedBox(width: 4),
                  Text('2 Bed'),
                  SizedBox(width: 16),
                  Icon(Icons.bathtub, size: 18),
                  SizedBox(width: 4),
                  Text('2 Bath'),
                ],
              ),
              const SizedBox(height: 20),

              // About Section
              const Text(
                'About',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Floor plans can be 2D or 3D, and they often include measurements, symbols, and annotations to indicate important details like electrical outlets, plumbing fixtures, and structural elements.',
                style: TextStyle(height: 1.4),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF731963) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
