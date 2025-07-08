import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import 'overview_tab.dart';
import 'prices_tab.dart';
import 'main_navigation_wrapper.dart';
class PriceTrendsPage4 extends StatelessWidget {
  const PriceTrendsPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
     bottomNavigationBar: CustomBottomNav(
  currentIndex: 2,
  onTap: (index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainNavigationWrapper(initialIndex: index),
      ),
    );
  },
),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFF7E1846),
                tabs: [
                  Tab(text: 'Overview'),
                  Tab(text: 'Prices'),
                ],
              ),
              const SizedBox(height: 10),
              const Expanded(
                child: TabBarView(
                  children: [
                    OverviewTab(),
                    PricesTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Film City Road",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                "Western Mumbai, Mumbai",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
