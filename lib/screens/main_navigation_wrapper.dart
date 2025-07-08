import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'property_search_screen.dart';
import 'price_trends_page1.dart';
import 'profile_screen.dart';
import '../widgets/custom_bottom_nav.dart';

class MainNavigationWrapper extends StatefulWidget {
  final int initialIndex;

  const MainNavigationWrapper({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  late int _selectedIndex;

  final List<Widget> _screens = const [
    HomeScreen(),
    PropertySearchScreen(),
    PriceTrendsPage1(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 🔥 Ensures nav bar floats over body
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}
