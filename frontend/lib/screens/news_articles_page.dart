import 'package:flutter/material.dart';
import '../widgets/article_card.dart';
import '../widgets/custom_bottom_nav.dart';
import 'main_navigation_wrapper.dart';
import 'article_detail_page.dart';

class NewsArticlesPage extends StatefulWidget {
  const NewsArticlesPage({Key? key}) : super(key: key);

  @override
  State<NewsArticlesPage> createState() => _NewsArticlesPageState();
}

class _NewsArticlesPageState extends State<NewsArticlesPage> {
  bool isNewsSelected = true;
  int selectedCategory = 0;
  int currentIndex = 0; // For bottom nav logic

  final List<String> categories = [
    'All',
    'Infrastructure',
    'Commercial',
    'Housing',
    'Rental',
  ];

  final List<String> articleImages = [
    'assets/p1.png',
    'assets/p2.png',
    'assets/p3.png',
    'assets/p4.png',
  ];

  void _handleNavigation(int index) {
    setState(() => currentIndex = index);

    // Navigate to main sections with bottom nav logic
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainNavigationWrapper(initialIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: _handleNavigation,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.jpg',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Mumbai Property\n${isNewsSelected ? "News" : "Articles"}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Toggle Pills
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      toggleButton('News', true),
                      toggleButton('Articles', false),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Main White Container
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Filter Chips
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ChoiceChip(
                                label: Text(categories[index]),
                                selected: selectedCategory == index,
                                selectedColor: const Color(0xFF7A183A),
                                labelStyle: TextStyle(
                                  color: selectedCategory == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onSelected: (_) {
                                  setState(() {
                                    selectedCategory = index;
                                  });
                                },
                                backgroundColor: Colors.grey.shade200,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Articles List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ArticleDetailPage(
                                    imageAsset:
                                        articleImages[index % articleImages.length],
                                    title: 'Real estate News',
                                    subtitle:
                                        'Bangalore Civic achieves 88% of the property tax collection target set....',
                                  ),
                                ),
                              );
                            },
                            child: ArticleCard(
                              title: 'Real estate News',
                              subtitle:
                                  'Bangalore Civic achieves 88% of the property tax collection target set....',
                              date: 'Mar 03, 2025',
                              imageAsset:
                                  articleImages[index % articleImages.length],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget toggleButton(String label, bool isLeft) {
    final isSelected = isNewsSelected == isLeft;

    return GestureDetector(
      onTap: () {
        setState(() {
          isNewsSelected = isLeft;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7A183A) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF7A183A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
