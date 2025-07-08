import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class FloorPlansUnitsGridPage extends StatelessWidget {
  const FloorPlansUnitsGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    'Floor Plans',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Locations',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.mic, color: Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Dropdown section
              Row(
                children: const [
                  Text(
                    '1 Bed room Apartments',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              const SizedBox(height: 16),

              // Floor plan cards
              Expanded(
                child: ListView(
                  children: const [
                    FloorPlanCard(
                      title: 'Unit 1 - Floor 1-3',
                      bedrooms: 2,
                      bathrooms: 2,
                      imagePath: 'assets/p1.png',
                    ),
                    SizedBox(height: 16),
                    FloorPlanCard(
                      title: 'Unit 2 - Floor 4-6',
                      bedrooms: 3,
                      bathrooms: 2,
                      imagePath: 'assets/p2.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ Using your custom nav bar correctly now
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 1, // set index accordingly
        onTap: (index) {
          // TODO: handle navigation
        },
      ),
    );
  }
}

class FloorPlanCard extends StatelessWidget {
  final String title;
  final int bedrooms;
  final int bathrooms;
  final String imagePath;

  const FloorPlanCard({
    super.key,
    required this.title,
    required this.bedrooms,
    required this.bathrooms,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFF731963),
                  child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              children: [
                const Icon(Icons.bed, size: 20, color: Colors.black54),
                const SizedBox(width: 4),
                Text('$bedrooms Bed'),
                const SizedBox(width: 16),
                const Icon(Icons.bathtub, size: 20, color: Colors.black54),
                const SizedBox(width: 4),
                Text('$bathrooms Bath'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
