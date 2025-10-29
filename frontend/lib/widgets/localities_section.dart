import 'package:flutter/material.dart';

class LocalitiesSection extends StatelessWidget {
  const LocalitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> localities = [
      {
        'title': 'Sky Dandelions',
        'subtitle': 'Apartment',
        'rating': '4.9',
        'location': 'Jakarta, Indonesia',
        'image': 'assets/images/bg.jpg', // Use your actual image path
      },
      {
        'title': 'Sky Dandelions',
        'subtitle': 'Apartment',
        'rating': '4.9',
        'location': 'Jakarta, Indonesia',
        'image': 'assets/images/bg.jpg',
      },
      {
        'title': 'Sky Dandelions',
        'subtitle': 'Apartment',
        'rating': '4.9',
        'location': 'Jakarta, Indonesia',
        'image': 'assets/images/bg.jpg',
      },
    ];

    return Container(
      color: const Color(0xFFFFF6E6),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Emerging Localities',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: localities.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = localities[index];
                return Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Left Image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              item['image'],
                              width: 120,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                            // Heart icon
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.favorite_border,
                                  size: 16,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                            // Apartment tag
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFF7D2948),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  item['subtitle'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Right info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item['title']} Apartment',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star, size: 16, color: Colors.amber),
                                  const SizedBox(width: 4),
                                  Text(
                                    item['rating'],
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.location_pin, size: 16, color: Colors.deepPurple),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      item['location'],
                                      style: const TextStyle(fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
