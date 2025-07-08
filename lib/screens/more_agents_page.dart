import 'package:flutter/material.dart';
import '../widgets/agent_card.dart';
import '../widgets/custom_bottom_nav.dart';

class MoreAgentsPage extends StatefulWidget {
  const MoreAgentsPage({Key? key}) : super(key: key);

  @override
  State<MoreAgentsPage> createState() => _MoreAgentsPageState();
}

class _MoreAgentsPageState extends State<MoreAgentsPage> {
  final List<Map<String, String>> agents = [
    {
      'name': 'Ananya Joshi',
      'agency': 'NestAway',
      'image': 'assets/p1.png',
    },
    {
      'name': 'Karan Patel',
      'agency': 'PropTiger',
      'image': 'assets/p2.png',
    },
    {
      'name': 'Sneha Shah',
      'agency': 'NoBroker',
      'image': 'assets/p3.png',
    },
    {
      'name': 'Rohit Gupta',
      'agency': 'SquareYards',
      'image': 'assets/p4.png',
    },
    {
      'name': 'Meera Desai',
      'agency': 'MagicBricks',
      'image': 'assets/p5.png',
    },
    {
      'name': 'Aditya Rana',
      'agency': 'Housing.com',
      'image': 'assets/p6.png',
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF7A183A),
        title: const Text('More Agents'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: agents.length,
          itemBuilder: (context, index) {
            final agent = agents[index];
            return AgentCard(
              name: agent['name']!,
              agency: agent['agency']!,
              imageAsset: agent['image']!,
            );
          },
        ),
      ),
    );
  }
}
