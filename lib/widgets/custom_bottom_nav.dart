import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF5D0E41),
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home_outlined,
                  color: currentIndex == 0 ? Colors.yellow : Colors.white,
                  size: currentIndex == 0 ? 30 : 26),
              onPressed: () => onTap(0),
            ),
            IconButton(
              icon: Icon(Icons.analytics_outlined,
                  color: currentIndex == 1 ? Colors.yellow : Colors.white,
                  size: currentIndex == 1 ? 30 : 26),
              onPressed: () => onTap(1),
            ),
            IconButton(
              icon: Icon(Icons.auto_graph_outlined,
                  color: currentIndex == 2 ? Colors.yellow : Colors.white,
                  size: currentIndex == 2 ? 30 : 26),
              onPressed: () => onTap(2),
            ),
            GestureDetector(
              onTap: () => onTap(3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Dot(
                      color: currentIndex == 3 ? Colors.yellow : Colors.white,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final Color color;

  const Dot({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
