import 'package:flutter/material.dart';

class TransactionPricePage extends StatefulWidget {
  const TransactionPricePage({super.key});

  @override
  State<TransactionPricePage> createState() => _TransactionPricePageState();
}

class _TransactionPricePageState extends State<TransactionPricePage> {
  int currentPage = 1;
  int totalPages = 300;

  List<Map<String, String>> transactions = [
    {
      'date': '01 Mar 2025',
      'society': 'DS Max Sangam',
      'price': 'Rs. 47.5 l',
    },
    {
      'date': '28 Feb 2025',
      'society': 'Prestige Shantiniketan',
      'price': 'Rs. 3.14 cr',
    },
    {
      'date': '27 Feb 2025',
      'society': 'Prestige Shantiniketan',
      'price': 'Rs. 5.52 cr',
    },
    {
      'date': '27 Feb 2025',
      'society': 'Brigade Cosmopolis',
      'price': 'Rs. 1.4 cr',
    },
    {
      'date': '25 Feb 2025',
      'society': 'Prestige Park Grove',
      'price': 'Rs. 1.69 cr',
    },
    {
      'date': '25 Feb 2025',
      'society': 'DS Max Sangam',
      'price': 'Rs. 58.75 l',
    },
    {
      'date': '24 Feb 2025',
      'society': 'Lakshmi Greens',
      'price': 'Rs. 53.75 l',
    },
    {
      'date': '21 Feb 2025',
      'society': 'The Five Summits',
      'price': 'Rs. 4.15 cr',
    },
    {
      'date': '20 Feb 2025',
      'society': 'Lakshmi Greens',
      'price': 'Rs. 64.55 l',
    },
    {
      'date': '19 Feb 2025',
      'society': 'Total Windmills',
      'price': 'Rs. 9 cr',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: SafeArea(
        child: Column(
          children: [
            // Gradient AppBar
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7A1630), Color(0xFFA83248)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Transaction Details',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Showing Results
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: const Color(0xFF7A1630),
              child: const Center(
                child: Text(
                  'Showing Results\n10600 of 11012',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Filter buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  _pill(const Icon(Icons.tune, size: 18), "  "),
                  _pill(null, "Price"),
                  _pill(null, "Society"),
                  _pill(null, "Apartment"),
                ],
              ),
            ),

            // Table header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: const [
                  Expanded(flex: 2, child: Text('Registry Date', style: _headerStyle)),
                  Expanded(flex: 3, child: Text('Society', style: _headerStyle)),
                  Expanded(flex: 2, child: Text('Agreement', style: _headerStyle)),
                ],
              ),
            ),

            // Table rows
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  return Container(
                    color: index % 2 == 0 ? Colors.white : const Color(0xFFF8F8F8),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(tx['date']!)),
                        Expanded(flex: 3, child: Text(tx['society']!)),
                        Expanded(flex: 2, child: Text(tx['price']!)),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Pagination footer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Text('Page $currentPage of $totalPages'),
                  const Spacer(),
                  TextButton(
                    onPressed: currentPage > 1
                        ? () => setState(() => currentPage--)
                        : null,
                    child: const Text('< Prev'),
                  ),
                  TextButton(
                    onPressed: currentPage < totalPages
                        ? () => setState(() => currentPage++)
                        : null,
                    child: const Text('Next >'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pill(Widget? icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Color(0xFF7A1630)),
        ),
        avatar: icon,
        label: Text(
          label,
          style: const TextStyle(color: Color(0xFF7A1630), fontSize: 14),
        ),
      ),
    );
  }
}

const TextStyle _headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black87,
  fontSize: 14,
);
