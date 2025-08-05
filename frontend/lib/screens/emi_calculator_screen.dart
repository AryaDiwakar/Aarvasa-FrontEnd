import 'package:flutter/material.dart';
import 'dart:math';

class EMICalculatorScreen extends StatefulWidget {
  @override
  _EMICalculatorScreenState createState() => _EMICalculatorScreenState();
}

class _EMICalculatorScreenState extends State<EMICalculatorScreen> {
  double loanAmount = 81; // in Lacs
  double interestRate = 8.0;
  int loanTenure = 10; // in years

  double calculateEMI() {
    double principal = loanAmount * 100000; // converting lacs to INR
    double monthlyRate = interestRate / 12 / 100;
    int months = loanTenure * 12;

    double emi = (principal * monthlyRate * pow(1 + monthlyRate, months)) /
        (pow(1 + monthlyRate, months) - 1);

    return emi.isFinite ? emi : 0;
  }

  @override
  Widget build(BuildContext context) {
    double emi = calculateEMI();

    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI Calculator'),
        backgroundColor: Colors.pink.shade700,
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Check your Estimated EMI",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Loan Amount
            Text("Loan Amount     ₹${loanAmount.toStringAsFixed(0)} Lacs"),
            Slider(
              value: loanAmount,
              min: 1,
              max: 2700, // 27 Cr
              divisions: 2699,
              label: "${loanAmount.toStringAsFixed(0)}",
              activeColor: Colors.pink.shade800,
              onChanged: (value) {
                setState(() {
                  loanAmount = value;
                });
              },
            ),

            // Interest Rate
            Text("Interest Rate %     ${interestRate.toStringAsFixed(1)}%"),
            Slider(
              value: interestRate,
              min: 7.0,
              max: 15.0,
              divisions: 80,
              label: "${interestRate.toStringAsFixed(1)}",
              activeColor: Colors.pink.shade800,
              onChanged: (value) {
                setState(() {
                  interestRate = value;
                });
              },
            ),

            // Loan Tenure
            Text("Preferred Loan Tenure     $loanTenure years"),
            Slider(
              value: loanTenure.toDouble(),
              min: 1,
              max: 30,
              divisions: 29,
              label: "$loanTenure",
              activeColor: Colors.pink.shade800,
              onChanged: (value) {
                setState(() {
                  loanTenure = value.round();
                });
              },
            ),

            const SizedBox(height: 30),
            const Text("Estimated EMI per month\nyou may consider",
                style: TextStyle(fontSize: 16)),

            const SizedBox(height: 10),
            Text(
              "₹${emi.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
