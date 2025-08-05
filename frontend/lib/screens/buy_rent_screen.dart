import 'package:flutter/material.dart';

class BuyRentScreen extends StatefulWidget {
  const BuyRentScreen({super.key});

  @override
  State<BuyRentScreen> createState() => _BuyRentScreenState();
}

class _BuyRentScreenState extends State<BuyRentScreen> {
  String? selectedOption; // Tracks selected option

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
                value: 0.25,
                color: Color(0xFF6E1B3A),
                backgroundColor: Color(0xFFEEE6EA),
              ),
              const SizedBox(height: 24),
              const Text(
                "Are you looking to buy or rent a property?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 24),
              _optionTile("Rent"),
              const SizedBox(height: 12),
              _optionTile("Buy"),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pushNamed(context, '/propertyType'),
                      child: const Text("Skip"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // You can pass selectedOption if needed
                        Navigator.pushNamed(context, '/propertyType');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6E1B3A),
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

  Widget _optionTile(String label) {
    final isSelected = selectedOption == label;

    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6E1B3A) : Colors.transparent,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.white : Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
