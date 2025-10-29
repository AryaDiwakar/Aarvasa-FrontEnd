import 'package:flutter/material.dart';

class BudgetCalculatorScreen extends StatefulWidget {
  const BudgetCalculatorScreen({super.key});

  @override
  State<BudgetCalculatorScreen> createState() => _BudgetCalculatorScreenState();
}

class _BudgetCalculatorScreenState extends State<BudgetCalculatorScreen> {
  double savings = 25;
  double emi = 14000;
  double tenure = 20;

  String get budgetRange {
    double total = savings * 100000 + emi * 12 * tenure;
    double low = total * 0.85;
    double high = total * 1.05;
    return '₹${(low / 100000).round()} - ${(high / 100000).round()} Lacs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budget Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Check your Home buying budget',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 20),
          Text('Saving for buying home  ₹${savings.round()} Lacs'),
          Slider(
            min: 0,
            max: 5000,
            value: savings,
            onChanged: (val) => setState(() => savings = val),
          ),
          Text('EMI you can afford  ₹${emi.round()}'),
          Slider(
            min: 1000,
            max: 1000000,
            value: emi,
            onChanged: (val) => setState(() => emi = val),
          ),
          Text('Preferred Loan Tenure  ${tenure.round()} years'),
          Slider(
            min: 2,
            max: 30,
            value: tenure,
            onChanged: (val) => setState(() => tenure = val),
          ),
          const SizedBox(height: 20),
          const Text('Budget range you may consider'),
          const SizedBox(height: 10),
          Text(
            budgetRange,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ]),
      ),
    );
  }
}
