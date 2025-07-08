import 'package:flutter/material.dart';

class YourActivityPage extends StatefulWidget {
  const YourActivityPage({super.key});

  @override
  State<YourActivityPage> createState() => _YourActivityPageState();
}

class _YourActivityPageState extends State<YourActivityPage> {
  String selectedTab = 'Recent Searches';

  Widget buildTab(String label) {
    bool isSelected = selectedTab == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF4D5DF) : Colors.transparent,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildDateSection(String date, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          date,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map((item) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.apartment, color: Colors.black87),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final recentItemsToday = [
      'Residential Properties for rent in Tambaram',
    ];
    final recentItemsFeb17 = [
      'Residential Properties for buy in Chennai',
    ];
    final recentItemsFeb6 = [
      'Residential Properties for buy in Chennai',
      'Residential Properties for buy in Chennai',
      'Residential Properties for buy in Chennai',
      'Residential Properties for buy in Chennai',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 8),
            const Text(
              'Your Activity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                buildTab('Recent Searches'),
                buildTab('Viewed'),
                buildTab('Contacted'),
              ],
            ),
            const SizedBox(height: 20),
            buildDateSection('Today', recentItemsToday),
            buildDateSection('17 Feb 2025', recentItemsFeb17),
            buildDateSection('06 Feb 2025', recentItemsFeb6),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
