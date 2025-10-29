import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ['Filter', 'Rent', 'Residential', 'Yearly', 'Beds', 'Price', 'Area', 'All Filters'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(filters.length, (index) {
            final bool isFirst = index == 0;
            final bool isSelected = isFirst; // Only first chip is selected for now

            return Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFF7E7F9) : Colors.white,
                border: Border.all(
                  color: isSelected ? const Color(0xFF912BBC) : Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  if (isFirst || filters[index] == "All Filters") ...[
                    Icon(
                      Icons.tune,
                      size: 18,
                      color: isSelected ? const Color(0xFF5E154B) : Colors.grey,
                    ),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    filters[index],
                    style: TextStyle(
                      color: isSelected ? const Color(0xFF5E154B) : Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
