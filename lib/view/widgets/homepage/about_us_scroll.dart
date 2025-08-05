import 'package:flutter/material.dart';

class AboutUsHeading extends StatelessWidget {
  const AboutUsHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Background color
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "ABOUT US",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              letterSpacing: 4,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "WHAT MAKES US",
            style: TextStyle(
              color: Color(0xFF444B54), // Dark gray
              fontSize: 40,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            "STAND ABOVE THE REST",
            style: TextStyle(
              color: Color(0xFFF7A700), // Orange/yellow
              fontSize: 40,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
