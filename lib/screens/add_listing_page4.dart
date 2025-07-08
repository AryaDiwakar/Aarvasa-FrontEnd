import 'package:flutter/material.dart';
import 'main_navigation_wrapper.dart';

class AddListingPage4 extends StatefulWidget {
  @override
  State<AddListingPage4> createState() => _AddListingPage4State();
}

class _AddListingPage4State extends State<AddListingPage4> {
  final TextEditingController sellPriceController = TextEditingController();
  final TextEditingController rentPriceController = TextEditingController();

  bool isMonthly = true;

  int bedRooms = 2;
  int bathRooms = 2;
  int balconies = 2;

  Widget buildCounterRow(String label, int value, VoidCallback onAdd, VoidCallback onRemove) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 15))),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: value > 0 ? onRemove : null,
          ),
          Text(value.toString(), style: const TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    sellPriceController.dispose();
    rentPriceController.dispose();
    super.dispose();
  }

  void _submitListing() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Success"),
        content: const Text("Listing Submitted Successfully!"),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MainNavigationWrapper()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildPriceField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixText: "₹ ",
        hintText: label,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text("Add Listing"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF912C54), Color(0xFFD05A7F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  const Text(
                    "Almost Finish, complete the listing",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),

                  /// Sell Price
                  buildPriceField("Sell Price", sellPriceController),
                  const SizedBox(height: 16),

                  /// Rent Price
                  buildPriceField("Rent Price", rentPriceController),
                  const SizedBox(height: 16),

                  /// Monthly / Yearly Toggle
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => setState(() => isMonthly = true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isMonthly ? const Color(0xFFD05A7F) : Colors.grey[200],
                            foregroundColor: isMonthly ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Monthly"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => setState(() => isMonthly = false),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !isMonthly ? const Color(0xFFD05A7F) : Colors.grey[200],
                            foregroundColor: !isMonthly ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Yearly"),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text("Property Features", style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),

                  buildCounterRow(
                    "Bed Room",
                    bedRooms,
                    () => setState(() => bedRooms++),
                    () => setState(() => bedRooms--),
                  ),
                  buildCounterRow(
                    "Bath Room",
                    bathRooms,
                    () => setState(() => bathRooms++),
                    () => setState(() => bathRooms--),
                  ),
                  buildCounterRow(
                    "Balcony",
                    balconies,
                    () => setState(() => balconies++),
                    () => setState(() => balconies--),
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _submitListing,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF912C54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Next", style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
