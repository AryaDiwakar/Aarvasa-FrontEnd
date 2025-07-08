import 'package:flutter/material.dart';

class TopGainersSection extends StatelessWidget {
  const TopGainersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Top Gainers Section
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Top Gainers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text(
                    'Across india',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Toggle Buttons
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Localities',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Societies',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Top Gainers List Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Top 5 in Chennai',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    Text('See All',
                        style: TextStyle(color: Colors.pinkAccent, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 16),

                // List Items
                Column(
                  children: [
                    _buildGainerItem('AkurlI Nag....', '4.9%', true),
                    _buildGainerItem('Motilal Na..', '25%', false),
                    _buildGainerItem('Malvani', '9%', false),
                    _buildGainerItem('Kumar singh', '65%', false),
                  ],
                ),

                const SizedBox(height: 20),

                // View Trends Button
                Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Text(
                      'View trends',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Ask Me A Question Section
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFFCFCFC),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Post your Question ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: '(Username..)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'e.g. “How can I get a home loan with low credit score”',
                    filled: true,
                    fillColor: const Color(0xFF89295D),
                    hintStyle: const TextStyle(color: Colors.white70),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Describe Your question here',
                    filled: true,
                    fillColor: const Color(0xFF89295D),
                    hintStyle: const TextStyle(color: Colors.white70),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.upload, size: 18),
                      label: const Text('Upload Image (optional)'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF89295D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF89295D),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Icon(Icons.refresh, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (_) {}),
                    const Text("Notify me when Someone Answers"),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit Your Question'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF89295D),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGainerItem(String name, String percent, bool isRed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Text(
            percent,
            style: TextStyle(
              color: isRed ? Colors.redAccent : Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 50,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                colors: isRed
                    ? [Colors.redAccent.shade100, Colors.redAccent]
                    : [Colors.greenAccent.shade100, Colors.greenAccent],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
