import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String actionText;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Text(description,
              style: const TextStyle(color: Colors.black87, fontSize: 14)),
          const SizedBox(height: 12),
          Text(
            actionText,
            style: const TextStyle(
              color: Color(0xFF7A1630), // Maroon
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
