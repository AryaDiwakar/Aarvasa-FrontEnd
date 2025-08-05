import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;

  const ArticleDetailPage({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Author and time row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assets/p1.png'),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Mumbai Film City Road',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    '21m',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 12),

              // Main image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imageAsset, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),

              // Title
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),

              // Sections
              Text(
                'The Dynamic Mumbai Property\nImpact of Infrastructure Development',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7A183A),
                ),
              ),
              const SizedBox(height: 12),

              // Body Paragraph
              Text(
                '''Impact of Infrastructure Development
Mumbai’s property market has been heavily influenced by infrastructure development. The construction of the Mumbai Metro, the Eastern and Western Peripheral Expressways, and various flyovers has improved connectivity and made once distant areas more accessible.

Mumbai, often referred to as the financial capital of India, is one of the most vibrant real estate markets in the country. As the hub of business, entertainment, and culture, the city attracts a wide range of property buyers, investors, and developers. Whether you’re looking to buy a luxurious apartment in South Mumbai or invest in the burgeoning suburban areas, understanding the dynamics of Mumbai’s property market is essential for making informed decisions.

Mumbai’s property market has seen tremendous growth over the last few decades, but recent trends indicate a shift in buyer preferences, largely due to changes in the global and local economy, as well as the ongoing urbanization of the city. Some notable trends include:''',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
