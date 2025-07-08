import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  bool hasFavourites = true; // Toggle this for testing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B1C5A), Color(0xFFB13977)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'Favourites',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            Expanded(
              child: hasFavourites ? _buildFavouritesList() : _buildEmptyState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.format_list_bulleted, size: 60, color: Colors.black54),
          const SizedBox(height: 20),
          const Text(
            'Save Your Favourite\nProperties Now!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "It look like you haven't added any favourite properties just yet. You can add a property listing to your favourites by tapping the icon at the top right corner of property details.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Action for search
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B1C5A),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            child: const Text(
              'Start a New Search',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavouritesList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Recently added',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        _buildPropertyCard(),
      ],
    );
  }

  Widget _buildPropertyCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.network(
                  'https://images.unsplash.com/photo-1568605114967-8130f3a36994',
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Verified',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              const Positioned(
                top: 10,
                right: 10,
                child: Icon(Icons.favorite, color: Colors.red),
              ),
              const Positioned(
                top: 70,
                left: 10,
                child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
              const Positioned(
                top: 70,
                right: 10,
                child: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.bed, size: 16),
                    SizedBox(width: 4),
                    Text('2'),
                    SizedBox(width: 12),
                    Icon(Icons.bathtub, size: 16),
                    SizedBox(width: 4),
                    Text('2'),
                    SizedBox(width: 12),
                    Icon(Icons.square_foot, size: 16),
                    SizedBox(width: 4),
                    Text('1,012 sqft'),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  '1 Month Free | Green Community...',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const Text(
                  'The Gardens Building, India',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 6),
                const Text(
                  'INR 1,933,761 Yearly',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _iconAction(Icons.email),
                    const SizedBox(width: 12),
                    _iconAction(Icons.call),
                    const SizedBox(width: 12),
                    _iconAction(FontAwesomeIcons.whatsapp),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconAction(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 18),
    );
  }
}
