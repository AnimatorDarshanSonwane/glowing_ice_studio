import 'package:flutter/material.dart';

class WhyUsWidget extends StatelessWidget {
  const WhyUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color(0xFFF7A700), // Background yellow-orange
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      width: 1000, // Fixed width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "WHY US",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "MAKES US AN INDUSTRY-LEADING",
            style: TextStyle(
              color: Color(0xFF333333), // Dark gray
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "GAME DEVELOPMENT COMPANY",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 17),
          const Text(
            "Juego Studios is a reliable game development partner, having solid experience "
            "of many years in providing game and app development services to clients in "
            "the USA, UK, UAE, India, and other parts of the world. Our standards are on "
            "par with the top game and app development companies and technology ventures "
            "in the industry today.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}