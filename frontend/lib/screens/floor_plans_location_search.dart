import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart'; // Ensure this path is correct

class FloorPlansLocationSearch extends StatefulWidget {
  const FloorPlansLocationSearch({super.key});

  @override
  State<FloorPlansLocationSearch> createState() => _FloorPlansLocationSearchState();
}

class _FloorPlansLocationSearchState extends State<FloorPlansLocationSearch> {
  int currentIndex = 0;

  void onNavTap(int index) {
    setState(() {
      currentIndex = index;
    });
    print('Tapped index: $index');
  }

  final List<String> locations = [
    'Colaba',
    'Churchgate',
    'Tardeo',
    'Dadar',
    'Khar',
    'Malad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Foreground Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        "Search Results",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Mumbai",
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.mic),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Locations In Mumbai",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...locations.map(
                    (loc) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(loc),
                          trailing: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF5A0D36), // Maroon color
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(Icons.arrow_forward, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: onNavTap,
      ),
    );
  }
}
