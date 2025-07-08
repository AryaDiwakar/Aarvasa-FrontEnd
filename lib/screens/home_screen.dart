import 'package:flutter/material.dart';
import 'add_listing_page1.dart';
import 'news_articles_page.dart';
import 'main_navigation_wrapper.dart';
import 'contact_us.dart';
import 'login_screen.dart';

import '../widgets/top_header.dart';
import '../widgets/search_bar_section.dart';
import '../widgets/filter_chips.dart';
import '../widgets/recommended_results.dart';
import '../widgets/category_cards.dart';
import '../widgets/main_offer_card.dart';
import '../widgets/insights_and_utilities.dart';
import '../widgets/upcoming_projects.dart';
import '../widgets/builders_section.dart';
import '../widgets/offers_section.dart';
import '../widgets/localities_section.dart';
import '../widgets/top_gainers_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF7A173E),
              ),
              child: Text(
                'Aarvasa',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            // ✅ Home stays here
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),

            // ✅ Listing
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Listing'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddListingPage1()),
                );
              },
            ),

            // ✅ Property - index 1
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Property'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainNavigationWrapper(initialIndex: 1),
                  ),
                );
              },
            ),

            // ✅ News & Articles
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('News & Articles'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewsArticlesPage()),
                );
              },
            ),

            // ✅ Trends - index 2
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text('Trends'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainNavigationWrapper(initialIndex: 2),
                  ),
                );
              },
            ),

            // ✅ Post Your Question - ContactUsPage
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('Post Your Question'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUsPage()),
                );
              },
            ),

            // ✅ Profile - index 3
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainNavigationWrapper(initialIndex: 3),
                  ),
                );
              },
            ),

            // ✅ Sign Out - LoginScreen
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopHeader(),
                SearchBarSection(),
                FilterChips(),
                RecommendedResults(),
                CategoryCards(),
                MainOfferCard(),
                InsightsAndUtilities(),
                UpcomingProjects(),
                BuildersSection(),
                OffersSection(),
                LocalitiesSection(),
                TopGainersSection(),
              ],
            ),
          ),

          // ✅ Floating GPT Icon
          Positioned(
            bottom: 90,
            right: 24,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/ai-landing');
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade600,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/gpt.png',
                  width: 28,
                  height: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
