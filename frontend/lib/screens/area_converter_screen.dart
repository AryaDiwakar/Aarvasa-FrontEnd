import 'package:flutter/material.dart';

class AreaConverterScreen extends StatefulWidget {
  const AreaConverterScreen({super.key});

  @override
  State<AreaConverterScreen> createState() => _AreaConverterScreenState();
}

class _AreaConverterScreenState extends State<AreaConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _fromUnit = 'Square Feet';
  String _toUnit = 'Square Meters';
  String _convertedValue = '';

  final Map<String, double> conversionRates = {
    'Square Feet': 1.0,
    'Square Meters': 0.092903,
    'Acres': 2.2957e-5,
    'Hectares': 9.2903e-6,
  };

  void _convertArea() {
    final input = double.tryParse(_inputController.text);
    if (input == null) {
      setState(() {
        _convertedValue = 'Invalid input';
      });
      return;
    }

    final fromRate = conversionRates[_fromUnit]!;
    final toRate = conversionRates[_toUnit]!;
    final result = input * (toRate / fromRate);

    setState(() {
      _convertedValue = result.toStringAsFixed(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Area',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _fromUnit,
                    decoration: const InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(),
                    ),
                    items: conversionRates.keys
                        .map((unit) => DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _fromUnit = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _toUnit,
                    decoration: const InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                    items: conversionRates.keys
                        .map((unit) => DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _toUnit = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertArea,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              _convertedValue.isEmpty ? 'Converted Value will appear here' : 'Result: $_convertedValue $_toUnit',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
