import 'package:flutter/material.dart';

class WorkTogetherHeader extends StatelessWidget {
  const WorkTogetherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "LET'S",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "WORK TOGETHER",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: Color(0xFFFFC107), // Amber/golden color
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Please fill in the form and our representative will get back to you.",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white70,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
