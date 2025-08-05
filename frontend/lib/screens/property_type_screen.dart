import 'package:flutter/material.dart';

class PropertyTypeScreen extends StatelessWidget {
  const PropertyTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LinearProgressIndicator(
                value: 0.5,
                color: Color(0xFF6E1B3A),
                backgroundColor: Color(0xFFEEE6EA),
              ),
              const SizedBox(height: 24),
              const Text(
                "What type of property are you looking for?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _segment("Residential", true),
                  const SizedBox(width: 12),
                  _segment("Commercial", false),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _CircleOption(label: "Apartment"),
                  _CircleOption(label: "Villa"),
                  _CircleOption(label: "View More"),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pushNamed(context, '/location'),
                      child: const Text("Skip"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/location'),
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

  Widget _segment(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFF7D6E0) : Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}

class _CircleOption extends StatelessWidget {
  final String label;
  const _CircleOption({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(radius: 28, backgroundColor: Colors.black12),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
