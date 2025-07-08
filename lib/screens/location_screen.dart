import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locations = [
      "Chennai", "Delhi", "Bangalore",
      "Pune", "Surat", "Coimbatore",
      "Navi Mumbai", "Ahmedabad"
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LinearProgressIndicator(
                value: 0.75,
                color: Color(0xFF6E1B3A),
                backgroundColor: Color(0xFFEEE6EA),
              ),
              const SizedBox(height: 24),
              const Text(
                "Which areas are you interested in?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "You can choose multiple preferred locations",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Search for a locality, area or city",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Explore Location", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: locations
                    .map((loc) => Chip(
                          label: Text(loc),
                          backgroundColor: Colors.white,
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.black26),
                          ),
                        ))
                    .toList(),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/permission');
                      },
                      child: const Text("Skip"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/permission');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6E1B3A),
                      ),
                      child: const Text("Next"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
