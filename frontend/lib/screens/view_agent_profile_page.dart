import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class ViewAgentProfilePage extends StatefulWidget {
  final String name;
  final String agency;
  final String imageAsset;

  const ViewAgentProfilePage({
    Key? key,
    required this.name,
    required this.agency,
    required this.imageAsset,
  }) : super(key: key);

  @override
  State<ViewAgentProfilePage> createState() => _ViewAgentProfilePageState();
}

class _ViewAgentProfilePageState extends State<ViewAgentProfilePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                widget.imageAsset,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            widget.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7A183A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.agency,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Icon(Icons.star, color: Colors.amber, size: 28),
          const Text("4.8 Rating", style: TextStyle(color: Colors.grey)),

          const SizedBox(height: 30),

          // About Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "About Agent",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7A183A),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "An experienced property consultant with over 10 years in Mumbai real estate. Trusted by over 500+ clients for housing, rentals, and commercial solutions.",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Contact Options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                contactButton(Icons.phone, "Call"),
                contactButton(Icons.chat_bubble_outline, "Chat"),
                contactButton(Icons.mail_outline, "Email"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget contactButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF7A183A),
          radius: 24,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.black87)),
      ],
    );
  }
}
