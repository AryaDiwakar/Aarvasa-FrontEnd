import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/agent_card.dart';
import 'more_agents_page.dart'; // <-- Add this import

class FindMyAgentsPage extends StatefulWidget {
  const FindMyAgentsPage({Key? key}) : super(key: key);

  @override
  State<FindMyAgentsPage> createState() => _FindMyAgentsPageState();
}

class _FindMyAgentsPageState extends State<FindMyAgentsPage> {
  String selectedCity = 'Mumbai';
  final List<String> cities = ['Mumbai', 'Delhi', 'Bangalore', 'Chennai'];

  final List<Map<String, String>> agents = [
    {
      'name': 'Aarav Mehta',
      'agency': 'SquareYards',
      'image': 'assets/p1.png',
    },
    {
      'name': 'Priya Verma',
      'agency': 'MagicBricks',
      'image': 'assets/p2.png',
    },
    {
      'name': 'Rahul Desai',
      'agency': '99Acres',
      'image': 'assets/p3.png',
    },
    {
      'name': 'Neha Kapoor',
      'agency': 'Housing.com',
      'image': 'assets/p4.png',
    },
  ];

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
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.jpg',
            height: 280,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Find My Agents',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // City dropdown
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCity,
                      isExpanded: true,
                      items: cities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedCity = val!;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Top bar with "Top Agents" and "See More"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Agents',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MoreAgentsPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            color: Color(0xFF7A183A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Agent Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: agents.map((agent) {
                      return AgentCard(
                        name: agent['name']!,
                        agency: agent['agency']!,
                        imageAsset: agent['image']!,
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
