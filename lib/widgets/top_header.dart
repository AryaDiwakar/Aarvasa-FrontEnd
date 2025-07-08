import 'package:flutter/material.dart';

class TopHeader extends StatefulWidget {
  const TopHeader({super.key});

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  int selectedIndex = 0;

  final List<String> options = ['Buy', 'Rent', 'Plot', 'PG'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          height: 260,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home_pg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Top Icons (with working menu icon using Builder)
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.notifications_none, color: Colors.white, size: 26),
                  SizedBox(width: 15),
                  Icon(Icons.person, color: Colors.white, size: 26),
                ],
              ),
            ],
          ),
        ),

        // White Curved Container
        Positioned(
          top: 180,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location Row
                Row(
                  children: const [
                    Icon(Icons.location_pin, color: Color(0xFF912BBC)),
                    SizedBox(width: 6),
                    Text(
                      'Current Location',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'No 36, New Street, Munjurpet...',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Buy, Rent, Plot, PG Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(options.length, (index) {
                    final isSelected = index == selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF912BBC).withOpacity(0.1)
                              : const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF912BBC)
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              index == 0
                                  ? Icons.home_outlined
                                  : index == 1
                                      ? Icons.business_outlined
                                      : index == 2
                                          ? Icons.apartment
                                          : Icons.bed,
                              color: isSelected
                                  ? const Color(0xFF912BBC)
                                  : Colors.black87,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              options[index],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? const Color(0xFF912BBC)
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
