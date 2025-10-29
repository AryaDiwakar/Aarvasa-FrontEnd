import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class PriceTrendsPage2 extends StatelessWidget {
  final String selectedType;

  const PriceTrendsPage2({super.key, required this.selectedType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/floor-plans');
              break;
            case 2:
              break;
            case 3:
              Navigator.pushNamed(context, '/search');
              break;
          }
        },
      ),
      body: Stack(
        children: [
          // Top Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Title & Location
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Property Price\nMovement Over Time',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: Colors.white, size: 18),
                              SizedBox(width: 4),
                              Text(
                                'Mumbai',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '"Where your perfect place finds you."',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white70,
                            fontSize: 12),
                      ),
                      const SizedBox(height: 14),
                      _buildSearchBar(),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Curved White Container
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, -4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Center(
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Colors.black45),
                        ),
                        const SizedBox(height: 4),
                        Center(
                          child: Text(
                            selectedType,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xffa63852),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildFilterChips(),

                        const SizedBox(height: 12),

                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              _propertyCard(context, "Film City Road", false),
                              _propertyCard(context, "LBS Marg", false),
                              _propertyCard(context, "Varst Street", true),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.mic, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['Localities', 'Societies', 'Apartments'];
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              color: Color(0xfff6dfe3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.tune, color: Color(0xffa63852), size: 20),
          ),
          ...filters.map((f) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip(
                  label: Text(f),
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _propertyCard(BuildContext context, String name, bool isActive) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/price-trends-3');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isActive
              ? Border.all(color: Colors.blueAccent, width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/p1.png'),
                  radius: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  '\$32,000',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Western Mumbai, Mumbai • 100+ transaction in 5yr',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    '3.8',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('See Price Trends',
                    style: TextStyle(color: Colors.black54)),
                const SizedBox(width: 10),
                const Text(
                  'See all Properties',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.trending_up, color: Colors.green, size: 18),
                SizedBox(width: 4),
                Text(
                  '58.4% in 5y',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
