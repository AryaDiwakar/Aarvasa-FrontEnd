import 'package:flutter/material.dart';
import '../widgets/society_card.dart';
import '../widgets/stat_card.dart';
import '../widgets/faq_card.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Pros & Cons", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(child: StatCard(title: "Pros", content: "Great connectivity, parks, and schools nearby.")),
              SizedBox(width: 12),
              Expanded(child: StatCard(title: "Cons", content: "Traffic congestion during peak hours.")),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Property Supply", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(child: StatCard(title: "Overall", content: "362 Properties\n30% Apartment\n20% Land")),
              SizedBox(width: 12),
              Expanded(child: StatCard(title: "Apartments", content: "Most supplied unit\n₹12k – ₹25k")),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Property Demand", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(child: StatCard(title: "Overall", content: "400 Requests\nHigh demand")),
              SizedBox(width: 12),
              Expanded(child: StatCard(title: "Apartments", content: "Popular unit type\nTop: 2BHK, 3BHK")),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Societies in Film City Road", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(child: SocietyCard(title: "Adithya birla", subtitle: "5 BHK in Borivali", imagePath: "assets/p1.png")),
              SizedBox(width: 12),
              Expanded(child: SocietyCard(title: "Adithya greens", subtitle: "3 BHK in Borivali", imagePath: "assets/p2.png")),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Explore Nearby Landmarks", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Image.asset("assets/map.png", height: 180, fit: BoxFit.cover),
          const SizedBox(height: 24),
          const Text("Film City Road Ratings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("4.5 ★", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          const Text("300+ total reviews"),
          const SizedBox(height: 24),
          const Text("FAQs in Film City Road, Mumbai", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(child: FaqCard(question: "What are key factors in Film City Road?")),
              SizedBox(width: 12),
              Expanded(child: FaqCard(question: "What is the price trend over the last 3 years?")),
            ],
          ),
        ],
      ),
    );
  }
}
