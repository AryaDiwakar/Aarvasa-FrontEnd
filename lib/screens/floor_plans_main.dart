import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart'; // Make sure this path is correct

class FloorPlansMainPage extends StatefulWidget {
  const FloorPlansMainPage({Key? key}) : super(key: key);

  @override
  State<FloorPlansMainPage> createState() => _FloorPlansMainPageState();
}

class _FloorPlansMainPageState extends State<FloorPlansMainPage> {
  String selectedCountry = 'India';

  final List<Map<String, String>> locations = [
    {
      'city': 'Agra',
      'plans': '25,879 floor plans',
      'image': 'assets/images/bg.jpg',
    },
    {
      'city': 'Mumbai',
      'plans': '18,735 floor plans',
      'image': 'assets/images/bg.jpg',
    },
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Floor Plans',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Locations',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic_none_outlined, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  value: selectedCountry,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5D0E41)),
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Color(0xFF5D0E41)),
                  items: ['India', 'USA', 'UK']
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...locations.map((loc) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            loc['image']!,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      loc['city']!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      loc['plans']!,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF5D0E41),
                                  ),
                                  child: const Icon(Icons.arrow_forward,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 100),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          // Navigation logic can be added here if needed
        },
      ),
    );
  }
}
