import 'package:flutter/material.dart';
import 'price_trends_page2.dart';

class PriceTrendsPage1 extends StatefulWidget {
  const PriceTrendsPage1({super.key});

  @override
  State<PriceTrendsPage1> createState() => _PriceTrendsPage1State();
}

class _PriceTrendsPage1State extends State<PriceTrendsPage1> {
  bool expandMumbai = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/bg.jpg', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Property Rates & Price Trends',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'In India',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  const Text(
                    'Select City',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 14),

                  _cityCard(
                    image: 'assets/p1.png',
                    city: 'Mumbai',
                    subtitle: 'Goregaon',
                    expanded: expandMumbai,
                    onTap: () {
                      setState(() {
                        expandMumbai = !expandMumbai;
                      });
                    },
                  ),

                  if (expandMumbai) _buildExpandedFilters(),

                  _cityCard(
                    image: 'assets/p2.png',
                    city: 'Bangalore',
                    subtitle: 'Karnataka',
                    onTap: () {
                      // Future navigation for Bangalore
                    },
                  ),
                  _cityCard(
                    image: 'assets/p3.png',
                    city: 'Delhi',
                    subtitle: 'India',
                    onTap: () {
                      // Future navigation for Delhi
                    },
                  ),

                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("See More"),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Enter any city or locality',
          border: InputBorder.none,
          icon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic),
        ),
      ),
    );
  }

  Widget _cityCard({
    required String image,
    required String city,
    required String subtitle,
    required VoidCallback onTap,
    bool expanded = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF861657),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(expanded ? Icons.expand_less : Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _filterChip('Flat/Apartment', () => _navigateToPage2('Flat/Apartment')),
          _filterChip('Individual House', () => _navigateToPage2('Individual House')),
          _filterChip('Rent', () => _navigateToPage2('Rent')),
          _filterChip('Buy', () => _navigateToPage2('Buy')),
        ],
      ),
    );
  }

  Widget _filterChip(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF861657),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  void _navigateToPage2(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PriceTrendsPage2(selectedType: category),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF861657),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.search, color: Colors.white),
            Icon(Icons.trending_up, color: Colors.white),
            Icon(Icons.more_horiz, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
