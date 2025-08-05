import 'package:flutter/material.dart';
import '../widgets/notification_card.dart'; // Your custom card

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace with your actual logic to check if notifications exist
    final bool hasNotifications = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Navigate to notification settings if needed
            },
          ),
        ],
      ),
      body: hasNotifications
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: const [
                  // Uncomment these to show notifications
                  // NotificationCard(
                  //   title: "New Property Investment Alert!",
                  //   description:
                  //       "A premium commercial property has just been added",
                  //   actionText: "Check it out →",
                  // ),
                  // NotificationCard(
                  //   title: "Great news!",
                  //   description:
                  //       "The price for a property in [Neighborhood] has dropped by 5%",
                  //   actionText: "Explore more →",
                  // ),
                  // NotificationCard(
                  //   title: "Reminder!",
                  //   description:
                  //       "Your consultation with our real estate expert is scheduled for tomorrow at 3 PM. Tap here to review your appointment details",
                  //   actionText: "View Appointment Detail →",
                  // ),
                  // NotificationCard(
                  //   title: "Enhance your experience!",
                  //   description:
                  //       "Complete your profile now to receive personalized investment recommendations",
                  //   actionText: "Go to Profile →",
                  // ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.notifications_active_outlined,
                    size: 80,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No notifications Yet!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Handle navigation to search
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7A1630),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Continue Search',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
