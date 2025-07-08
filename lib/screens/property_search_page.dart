import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class PropertySearchPage extends StatefulWidget {
  const PropertySearchPage({super.key});

  @override
  State<PropertySearchPage> createState() => _PropertySearchPageState();
}

class _PropertySearchPageState extends State<PropertySearchPage> {
  int currentIndex = 1;

  void onNavTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: onNavTap,
      ),
      body: Stack(
        children: [
          // Top Section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location Search
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.flag_circle_outlined, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "India",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                      Icon(Icons.mic_none, color: Colors.grey),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Section: Research & Insights
                const Text("Research & Insights",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildBoxRow([
                    ("Transaction Price", Icons.receipt_long),
                    ("Rates & Trends", Icons.show_chart),
                    ("Locality Insights", Icons.location_city),
                  ]),
                ),
                const SizedBox(height: 20),

                // Section: Tool & Calculators
                const Text("Tool & Calculators",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildBoxRow([
                    ("ROI Calculator", Icons.calculate_outlined),
                    ("Budget Calculator", Icons.settings_suggest_outlined),
                    ("EMI Calculator", Icons.payments_outlined),
                  ]),
                ),
              ],
            ),
          ),

          // Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.35,
            minChildSize: 0.35,
            maxChildSize: 0.90,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEEF3), // light pink
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Center(
                      child: Icon(Icons.keyboard_arrow_up, size: 28, color: Colors.black54),
                    ),
                    const Center(
                      child: Text(
                        "Swipe Up to See More Details",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Section: Latest Updates For You
                    const Text(
                      "Latest Updates For You",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 12),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.image_outlined, size: 40),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Market Trends",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Discover Section
                    const Text(
                      "Discover in Chennai",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Localities and Societies in Chennai",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 12),

                    // Toggle Chips
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9AFC1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Localities"),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Societies"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Carousel
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 180,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/p1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              child: const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Most Searched",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  List<Widget> _buildBoxRow(List<(String, IconData)> items) {
    return items
        .map((item) => Expanded(
              child: Container(
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.$2, color: Colors.black87),
                    const SizedBox(height: 4),
                    Text(
                      item.$1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }
}
