import 'package:flutter/material.dart';

class PropertyDetail2 extends StatelessWidget {
  const PropertyDetail2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/p1.png', fit: BoxFit.cover, height: double.infinity),
          Positioned(
            top: 60,
            left: 16,
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.95,
            builder: (context, controller) => Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: ListView(
                controller: controller,
                children: [
                  const Center(child: Icon(Icons.keyboard_arrow_down)),
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
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.bed),
                      SizedBox(width: 5),
                      Text('2'),
                      SizedBox(width: 10),
                      Icon(Icons.bathtub),
                      SizedBox(width: 5),
                      Text('2'),
                      SizedBox(width: 10),
                      Icon(Icons.square_foot),
                      SizedBox(width: 5),
                      Text('1,012 sqft'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.location_on),
                      SizedBox(width: 5),
                      Text('The Gardens Building, India'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton(onPressed: () {}, child: const Text('View on Map')),
                      OutlinedButton(onPressed: () {}, child: const Text('30 places Nearby')),
                      OutlinedButton(onPressed: () {}, child: const Text('Beach')),
                      OutlinedButton(onPressed: () {}, child: const Text('Parks')),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '1 Month Free - Green Community - Pets Friendly - New building\n'
                    'Introducing your Private Garden Beach House\n'
                    'Introducing your Private Garden Beach House\n'
                    'Introducing your Private Garden Beach House\n'
                    'Introducing your...',
                    style: TextStyle(height: 1.5),
                  ),
                  const Text(
                    'Read More...',
                    style: TextStyle(color: Colors.pink),
                  ),
                  const SizedBox(height: 20),
                  const Text('Property Details:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(children: const [Expanded(child: Text('Type')), Text(': Apartment')]),
                  Row(children: const [Expanded(child: Text('Purpose')), Text(': For Rent')]),
                  Row(children: const [Expanded(child: Text('Furnishing')), Text(': Semifurnished')]),
                  Row(children: const [Expanded(child: Text('Added on')), Text(': 02 February,2025')]),
                  const SizedBox(height: 20),
                  const Center(child: Icon(Icons.more_horiz)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
