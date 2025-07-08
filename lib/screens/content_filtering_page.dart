import 'package:flutter/material.dart';

class ContentFilteringPage extends StatefulWidget {
  const ContentFilteringPage({Key? key}) : super(key: key);

  @override
  State<ContentFilteringPage> createState() => _ContentFilteringPageState();
}

class _ContentFilteringPageState extends State<ContentFilteringPage> {
  List<String> selectedCities = [];
  List<String> selectedTypes = [];
  String selectedBedroom = '';
  double budget = 35;

  final List<String> cities = ['Chennai', 'Pune', 'Mumbai', 'Bangalore', 'Hyderabad'];
  final List<String> types = ['Flats', 'PG', 'Villa', 'Apartments', 'Builder Floor'];
  final List<String> bedrooms = ['1BHK', '2BHK', '3BHK', '4BHK'];

  Widget _buildChip(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A183A), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Text(
                  'Filters',
                  style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Cities', style: TextStyle(color: Colors.white70)),
              ),
              Wrap(
                children: cities.map((city) {
                  return _buildChip(
                    city,
                    selectedCities.contains(city),
                    () {
                      setState(() {
                        selectedCities.contains(city)
                            ? selectedCities.remove(city)
                            : selectedCities.add(city);
                      });
                    },
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Types', style: TextStyle(color: Colors.white70)),
              ),
              Wrap(
                children: types.map((type) {
                  return _buildChip(
                    type,
                    selectedTypes.contains(type),
                    () {
                      setState(() {
                        selectedTypes.contains(type)
                            ? selectedTypes.remove(type)
                            : selectedTypes.add(type);
                      });
                    },
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('No of Bedrooms', style: TextStyle(color: Colors.white70)),
              ),
              Wrap(
                children: bedrooms.map((bedroom) {
                  return _buildChip(
                    bedroom,
                    selectedBedroom == bedroom,
                    () {
                      setState(() {
                        selectedBedroom = bedroom;
                      });
                    },
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Budget', style: TextStyle(color: Colors.white70)),
              ),
              Slider(
                value: budget,
                min: 5,
                max: 60,
                divisions: 55,
                label: '${budget.toStringAsFixed(0)}L',
                activeColor: Colors.white,
                thumbColor: Colors.pinkAccent,
                onChanged: (value) {
                  setState(() {
                    budget = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '${budget.toStringAsFixed(0)}L',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('Apply Filters'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white24,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
