import 'package:flutter/material.dart';

class NotificationsCenterPage extends StatefulWidget {
  const NotificationsCenterPage({super.key});

  @override
  State<NotificationsCenterPage> createState() => _NotificationsCenterPageState();
}

class _NotificationsCenterPageState extends State<NotificationsCenterPage> {
  bool emailRecommendations = false;
  bool recentlyViewed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Center'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get new updates based on your saved or recent searches',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),

            _buildToggleTile(
              title: 'Email Recommendations',
              subtitle: 'Stay connected and informed with product updates on Aarvasa',
              value: emailRecommendations,
              onChanged: (val) => setState(() => emailRecommendations = val),
            ),
            const SizedBox(height: 20),

            _buildToggleTile(
              title: 'Recently Viewed Properties',
              subtitle: '',
              value: recentlyViewed,
              onChanged: (val) => setState(() => recentlyViewed = val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: subtitle.isNotEmpty
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    subtitle,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF7A1531),
        ),
      ],
    );
  }
}
