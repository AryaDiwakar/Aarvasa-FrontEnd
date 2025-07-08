import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/stat_card.dart';
import '../widgets/society_card.dart';
import '../widgets/faq_card.dart';

class PricesTab extends StatelessWidget {
  const PricesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Property Rates: Film City Road, Mumbai", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Last 5 years"),
          const SizedBox(height: 4),
          const Text("₹32,000 / sq.ft", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("↑ 12% in last 1 year", style: TextStyle(color: Colors.green)),
          const SizedBox(height: 20),

          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, _) {
                        const labels = ['2019', '2020', '2021', '2022', '2023', '2024'];
                        return Text(labels[value.toInt()]);
                      },
                      interval: 1,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, interval: 5000),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                minX: 0,
                maxX: 5,
                minY: 20000,
                maxY: 40000,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    spots: const [
                      FlSpot(0, 22000),
                      FlSpot(1, 25000),
                      FlSpot(2, 27000),
                      FlSpot(3, 30000),
                      FlSpot(4, 29000),
                      FlSpot(5, 32000),
                    ],
                    color: Color(0xFF7E1846),
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  )
                ],
                gridData: FlGridData(show: true),
              ),
            ),
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
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7E1846)),
            onPressed: () {},
            child: const Text("See All Societies"),
          ),
          const SizedBox(height: 24),
          const Text("Properties in Film City Road, Mumbai", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildPropertyTag("Apartment"),
              const SizedBox(width: 10),
              _buildPropertyTag("House"),
            ],
          ),
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

  Widget _buildPropertyTag(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }
}
