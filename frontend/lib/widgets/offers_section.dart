import 'package:flutter/material.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> offers = [
      {
        'image': 'assets/images/o1.jpg',
        'title': 'Sky Dandelions',
        'location': 'Anna nagar, Thirumangalam',
        'price': '',
        'valid': '',
      },
      {
        'image': 'assets/images/o2.jpg',
        'title': 'Well Furnished ',
        'location': '100 Smart Street, LA, Chennai',
        'price': '\$ 1.59 - 2.50 Cr',
        'valid': '10 March',
      },
      {
        'image': 'assets/images/o3.jpg',
        'title': 'Embassy Groups',
        'location': 'CG nagar colony',
        'price': '\$ 1.9 - 2.0 Cr',
        'valid': '12 April',
      },
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFDF3DF),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(48),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Offers',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 4),
          const Text(
            'Existing offers for you',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 24),

          // Scrollable cards
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = offers[index];
                return OfferCard(
                  image: item['image']!,
                  title: item['title']!,
                  location: item['location']!,
                  price: item['price']!,
                  validTill: item['valid']!,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String image, title, location, price, validTill;

  const OfferCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.validTill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with heart icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  image,
                  height: 120,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 10,
                right: 10,
                child: Icon(Icons.favorite_border, color: Colors.deepPurpleAccent),
              )
            ],
          ),

          // Text section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                if (price.isNotEmpty)
                  Text(
                    price,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                if (validTill.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Valid Till',
                          style: TextStyle(fontSize: 12, color: Colors.black38),
                        ),
                        Text(
                          validTill,
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
