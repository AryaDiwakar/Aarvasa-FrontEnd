import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    const propertyTypes = ['Buy', 'Rent', 'Plot', 'PG', 'Commercial', 'Post a Property'];

    return Stack(
      children: [
        ClipPath(
          clipper: BottomCurveClipper(),
          child: Container(
            width: double.infinity,
            height: 280,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Location",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text(
                "Chennai",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: propertyTypes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return Chip(
                      label: Text(propertyTypes[index]),
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
