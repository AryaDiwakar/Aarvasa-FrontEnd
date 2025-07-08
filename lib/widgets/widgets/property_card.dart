import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/property_detail_1.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PropertyDetail1()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/p1.png',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 8,
                  left: 8,
                  child: Chip(
                    label: Text("✔ Verified", style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.green,
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
                const Positioned(
                  left: 8,
                  top: 65,
                  child: Icon(Icons.chevron_left, color: Colors.white),
                ),
                const Positioned(
                  right: 8,
                  top: 65,
                  child: Icon(Icons.chevron_right, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "INR 1,933,761 Yearly",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage("assets/p4.png"),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.bed, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text("2"),
                SizedBox(width: 12),
                Icon(Icons.bathtub, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text("2"),
                SizedBox(width: 12),
                Icon(Icons.square_foot, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text("1,012 sqft"),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "1 Month Free | Green Community...",
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              "The Gardens Building, India",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.email, color: Colors.black54),
                Icon(Icons.phone, color: Colors.black54),
                Icon(Icons.message, color: Colors.black54),
                FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
              ],
            )
          ],
        ),
      ),
    );
  }
}
