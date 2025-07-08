import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import 'main_navigation_wrapper.dart';

class AILandingPage extends StatefulWidget {
  const AILandingPage({Key? key}) : super(key: key);

  @override
  State<AILandingPage> createState() => _AILandingPageState();
}

class _AILandingPageState extends State<AILandingPage> {
  int currentIndex = 0;

  final List<String> recentSearches = ['4BHK Flats', 'Villas', 'Apartments'];

  void _handleNavigation(int index) {
    setState(() => currentIndex = index);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainNavigationWrapper(initialIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: _handleNavigation,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A183A), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting and profile
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good Morning,',
                        style: TextStyle(color: Colors.white70, fontSize: 20)),
                    SizedBox(height: 4),
                    Text('Siri',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.white54),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Recent searches
            Wrap(
              spacing: 10,
              children: recentSearches
                  .map(
                    (search) => Chip(
                      label: Text(search),
                      backgroundColor: Colors.white12,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 30),

            // AI Feature cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4,
                children: [
                  _buildFeatureCard(
                    title: 'Engage in\nconversation\nwith AI.',
                    icon: Icons.chat_bubble_outline,
                    onTap: () {
                      Navigator.pushNamed(context, '/ai-chat');
                    },
                  ),
                  _buildFeatureCard(
                    title: 'Content-\nBased\nFiltering',
                    icon: Icons.filter_alt_outlined,
                    isDark: true,
                    onTap: () {
                      Navigator.pushNamed(context, '/content-filter');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    bool isDark = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.black45 : Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.3,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.open_in_new, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
