import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class InsightsAndUtilities extends StatelessWidget {
  const InsightsAndUtilities({super.key});

  @override
  Widget build(BuildContext context) {
    final utilities = [
      {'icon': Icons.bar_chart_rounded, 'label': 'Price Trends'},
      {'icon': Icons.receipt_long_rounded, 'label': 'Transaction'},
      {'icon': Icons.star_border_rounded, 'label': 'Rating & Review'},
      {'icon': Icons.map_rounded, 'label': 'Price Trends'},
      {'icon': Icons.home_work_outlined, 'label': 'My property'},
      {'icon': Icons.article_outlined, 'label': 'Articles'},
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFFFE6F0),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title + See More
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Insights And Utilites',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              Text(
                'See More',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB0005B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Makes your job easier',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),

          /// Utilities grid
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: utilities
                  .map(
                    (utility) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              utility['icon'] as IconData,
                              color: Color(0xFFFFB800),
                              size: 28,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              utility['label'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
