import 'package:flutter/material.dart';
import 'new_estimate_form.dart'; // <-- Import the target page

class EstimateReportBreakdownPage extends StatelessWidget {
  const EstimateReportBreakdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDA4170),
        title: const Text('Estimate Report Breakdown'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _propertyHeader(),
            const SizedBox(height: 12),
            _estimateBreakdownCard(),
            const SizedBox(height: 20),
            _actionButtons(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewEstimateFormPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7A1249),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text('Request New Estimate'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _propertyHeader() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/house.jpg', width: 100, height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Turtle Bay', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('142 East 49th Street, 2C'),
                Text('2 BA | 2 BD | 1 HB'),
                SizedBox(height: 6),
                Text('Estimated cost: \$ 7,395', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _estimateBreakdownCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Estimate for: 2 BHK Flat - Gachibowli\nPrepared on: 22 June 2025\nClient Name: John\nPrepared by: Aarvasa Estimation Team',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          Table(
            border: TableBorder.all(color: Colors.black12),
            children: const [
              TableRow(
                decoration: BoxDecoration(color: Color(0xFFECECEC)),
                children: [
                  Padding(padding: EdgeInsets.all(8), child: Text('Item')),
                  Padding(padding: EdgeInsets.all(8), child: Text('Quantity')),
                  Padding(padding: EdgeInsets.all(8), child: Text('Unit Cost')),
                  Padding(padding: EdgeInsets.all(8), child: Text('Total Cost')),
                ],
              ),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8), child: Text('Base Property Price')),
                Padding(padding: EdgeInsets.all(8), child: Text('1')),
                Padding(padding: EdgeInsets.all(8), child: Text('₹62,00,000')),
                Padding(padding: EdgeInsets.all(8), child: Text('₹62,00,000')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8), child: Text('Interior (basic)')),
                Padding(padding: EdgeInsets.all(8), child: Text('1')),
                Padding(padding: EdgeInsets.all(8), child: Text('₹2,00,000')),
                Padding(padding: EdgeInsets.all(8), child: Text('₹2,00,000')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8), child: Text('Registration Charges')),
                Padding(padding: EdgeInsets.all(8), child: Text('1')),
                Padding(padding: EdgeInsets.all(8), child: Text('₹60,000')),
                Padding(padding: EdgeInsets.all(8), child: Text('₹60,000')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8), child: Text('GST (5%)')),
                Padding(padding: EdgeInsets.all(8), child: Text('1')),
                Padding(padding: EdgeInsets.all(8), child: Text('₹3,00,000')),
                Padding(padding: EdgeInsets.all(8), child: Text('₹3,00,000')),
              ]),
            ],
          )
        ],
      ),
    );
  }

  Widget _actionButtons() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _roundedButton(Icons.picture_as_pdf, 'Download Pdf'),
        _roundedButton(Icons.print, 'Print'),
        _roundedButton(Icons.edit, 'Request Edit'),
        _roundedButton(Icons.email, 'Send via Email'),
      ],
    );
  }

  Widget _roundedButton(IconData icon, String label) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7A1249),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF7A1249),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ''),
      ],
    );
  }
}
