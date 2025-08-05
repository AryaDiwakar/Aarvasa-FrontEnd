import 'package:flutter/material.dart';
import '../widgets/language_selection_modal.dart';
import 'your_activity.dart';
import 'transaction_price_page.dart'; // Import all target screens
import 'floor_plans_main.dart';
import 'blog_page.dart';
import 'find_my_agent_page.dart';
import 'favourites_page.dart';
import 'edit_profile_page.dart';
import 'estimate_reports_page.dart';    
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showLanguageModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true,
      builder: (_) => const LanguageSelectionModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Column(
        children: [
          // Top Gradient Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFBC6FF1), Color(0xFF5D0E41)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back + Profile Title
                Row(
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Avatar + Name + Email
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hi, Kannan R',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'kannanr70088@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Dark Mode + Edit Profile Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.dark_mode, color: Colors.white, size: 18),
                        label: const Text(
                          'Dark mode',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.edit, color: Colors.white, size: 18),
                        label: const Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const EditProfilePage()),
  );
},

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom Section
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'More on Aarvasa',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildListTile('My Activity', onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const YourActivityPage()),
                            );
                          }),
                          _buildListTile('Transaction', onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const TransactionPricePage()),
                            );
                          }),
                           _buildListTile('Estimate Reports', onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EstimateReportsPage()),
                            );
                          }),
                         _buildListTile('Our Blogs', onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BlogPage()),
                            );
                          }),
                          _buildListTile('Find my Agent', onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FindMyAgentsPage()),
                            );
                          }),
                          _buildListTile('Favorites', onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FavouritesPage()),
                            );
                          }),
                          _buildListTile('Floor plans', onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FloorPlansMainPage()),
                            );
                          }),
                          _buildListTile('Language', onTap: _showLanguageModal),
                        ],
                      ),
                    ),
                  ], 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: onTap,
        ),
      ),
    );
  }
}
