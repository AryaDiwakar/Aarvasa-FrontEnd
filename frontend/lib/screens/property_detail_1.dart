import 'package:flutter/material.dart';
import 'property_detail_2.dart';

class PropertyDetail1 extends StatelessWidget {
  const PropertyDetail1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔳 Background image gallery (PageView)
          PageView(
            children: [
              Image.asset('assets/p1.png', fit: BoxFit.cover, height: double.infinity),
              Image.asset('assets/p2.png', fit: BoxFit.cover, height: double.infinity),
              Image.asset('assets/p3.png', fit: BoxFit.cover, height: double.infinity),
              Image.asset('assets/p4.png', fit: BoxFit.cover, height: double.infinity),
            ],
          ),

          // 🔙 Back button
          Positioned(
            top: 60,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),

          // 🔳 Fullscreen icon
          Positioned(
            top: 60,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.fullscreen, color: Colors.white),
            ),
          ),

          // 🧾 Bottom info container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PropertyDetail2()),
                );
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 👆 Arrow
                    const Icon(Icons.keyboard_arrow_up, size: 28, color: Colors.grey),

                    const SizedBox(height: 12),

                    // 💸 Price + Verified
                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'INR 1,933,761 Yearly',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Chip(
                          label: Text("✔ Verified", style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // 🛏️ Property features row
                    Row(
                      children: const [
                        Icon(Icons.bed, size: 20, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('2'),
                        SizedBox(width: 12),
                        Icon(Icons.bathtub, size: 20, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('2'),
                        SizedBox(width: 12),
                        Icon(Icons.square_foot, size: 20, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('1,012 sqft'),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // 📍 Location
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.location_on, size: 20, color: Colors.grey),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'The Gardens Building, India',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
