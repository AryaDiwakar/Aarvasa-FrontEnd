import 'package:flutter/material.dart';
import 'estimate_report_breakdown.dart'; // Import breakdown page

class EstimateReportsPage extends StatelessWidget {
  const EstimateReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFE03D71), Color(0xFFE87C8C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Estimate Reports',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Get detailed cost estimates and service\nbreakdowns for your selected properties.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search by Property/location',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.person),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EstimateReportBreakdownPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.asset('assets/house.jpg'), // Use your asset path
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Turtle Bay', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('142 East 49th Street, 2C'),
                                Text('2 BA | 2 BD | 1 HB'),
                                SizedBox(height: 4),
                                Text('Estimated cost: \$ 7,395'),
                                Text('Status: Pending'),
                                Row(
                                  children: [
                                    Text('Download PDF '),
                                    Icon(Icons.picture_as_pdf, size: 16),
                                    SizedBox(width: 8),
                                    Text('Refresh 🔃'),
                                    SizedBox(width: 8),
                                    Text('Delete 🗑️'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DropdownButton<String>(
                                  value: 'Date',
                                  items: [DropdownMenuItem(value: 'Date', child: Text('Date'))],
                                  onChanged: null,
                                ),
                                DropdownButton<String>(
                                  value: 'Status',
                                  items: [DropdownMenuItem(value: 'Status', child: Text('Status'))],
                                  onChanged: null,
                                ),
                                DropdownButton<String>(
                                  value: 'Sort by',
                                  items: [DropdownMenuItem(value: 'Sort by', child: Text('Sort by'))],
                                  onChanged: null,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
