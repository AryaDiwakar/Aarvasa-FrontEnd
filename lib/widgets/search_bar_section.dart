import 'package:flutter/material.dart';

class SearchBarSection extends StatefulWidget {
  const SearchBarSection({super.key});

  @override
  State<SearchBarSection> createState() => _SearchBarSectionState();
}

class _SearchBarSectionState extends State<SearchBarSection> {
  final List<String> options = ['Buy', 'Rent', 'Plot', 'PG'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFDFDFD), // ✅ Set light background color here
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(options.length, (index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFF7E7F9) : const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(15),
                    border: isSelected
                        ? Border.all(color: const Color(0xFFD9B4DF))
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getIconForOption(options[index]),
                        color: isSelected ? const Color(0xFF912BBC) : Colors.black54,
                        size: 20,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        options[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: isSelected ? const Color(0xFF912BBC) : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Icon(Icons.mic, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForOption(String option) {
    switch (option) {
      case 'Buy':
        return Icons.home_outlined;
      case 'Rent':
        return Icons.key_outlined;
      case 'Plot':
        return Icons.grid_view_outlined;
      case 'PG':
        return Icons.apartment_outlined;
      default:
        return Icons.circle;
    }
  }
}
