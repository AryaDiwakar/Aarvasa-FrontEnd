import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import 'price_trends_page4.dart';
class PriceTrendsPage3 extends StatelessWidget {
  const PriceTrendsPage3({super.key});

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
          // Background Image with gradient overlay
          Container(
            height: 330,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.location_on, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          'Mumbai',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    "Property Price\nMovement Over Time",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Where your perfect place finds you.",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 20),

                  // Search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
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
                    ),
                  ),

                  const SizedBox(height: 20),

                  // White container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Locality + dropdown
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/p1.png', width: 50, height: 50, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Film City Road',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Western Mumbai, Mumbai',
                                    style: TextStyle(fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.expand_more),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Price Info
                        Row(
                          children: [
                            Text(
                              '\$ 32,000',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' /sq ft',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            Spacer(),
                            Text(
                              'Flat/Apartment',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(Icons.expand_more, size: 16, color: Colors.grey),
                          ],
                        ),

                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              '5% Rental Yield',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Spacer(),
                            Text(
                              '199.2% in Last 5 Years',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Graph
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset('assets/graph.png', fit: BoxFit.cover),
                        ),

                        const SizedBox(height: 24),

                        // Quick Links
                        Text(
                          "Quick Links for Film City Road",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.purple,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _linkTile("Properties in Film City Road"),
                        _linkTile("Transaction Prices in Film City Road"),
                        _linkTile("All Insights in Film City Road"),

                        const SizedBox(height: 24),

              SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () {
      Navigator.pushNamed(context, '/price-trends-4');
    },
    child: const Text(
      "See Detailed Price Trends",
      style: TextStyle(color: Colors.white),
    ),
  ),
),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkTile(String title) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(fontSize: 14)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
