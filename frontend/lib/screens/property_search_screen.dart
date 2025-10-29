import 'package:flutter/material.dart';
import '../widgets/property_card.dart';

class PropertySearchScreen extends StatefulWidget {
  const PropertySearchScreen({super.key});

  @override
  State<PropertySearchScreen> createState() => _PropertySearchScreenState();
}

class _PropertySearchScreenState extends State<PropertySearchScreen> {
  final List<String> topFilters = [
    'Rent',
    'Residential',
    'Yearly',
    'Best Deals',
  ];

  final List<String> bottomFilters = [
    'All',
    'Furnished',
    'Unfurnished',
  ];

  final Set<String> selectedFilters = {'All'};

  void _toggleFilter(String filter) {
    setState(() {
      if (filter == 'All') {
        selectedFilters.clear();
        selectedFilters.add('All');
      } else {
        selectedFilters.remove('All');
        if (selectedFilters.contains(filter)) {
          selectedFilters.remove(filter);
        } else {
          selectedFilters.add(filter);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // 🔍 Location & mic row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("India", style: TextStyle(fontSize: 16)),
                    Spacer(),
                    Icon(Icons.mic, color: Colors.grey),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔍 Top row filters
            SizedBox(
              height: 45,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: topFilters.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF7A2D54)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.tune, color: Color(0xFF7A2D54)),
                        onPressed: () {},
                      ),
                    );
                  } else {
                    final filter = topFilters[index - 1];
                    final isSelected = selectedFilters.contains(filter);

                    return GestureDetector(
                      onTap: () => _toggleFilter(filter),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.grey.shade300),
                          color: isSelected ? const Color(0xFFF8D7E8) : Colors.white,
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isSelected ? const Color(0xFF7A2D54) : Colors.black87,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),

            const SizedBox(height: 12),

            // 🔍 Second row filters: All, Furnished, Unfurnished
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: bottomFilters.map((filter) {
                  final isSelected = selectedFilters.contains(filter);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => _toggleFilter(filter),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: filter == 'All' && isSelected
                              ? const Color(0xFF7A2D54)
                              : isSelected
                                  ? const Color(0xFFF8D7E8)
                                  : Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: filter == 'All' && isSelected
                                ? Colors.white
                                : isSelected
                                    ? const Color(0xFF7A2D54)
                                    : Colors.black87,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // 🔍 Property card results
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const PropertyCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
