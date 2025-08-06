import 'package:flutter/material.dart';

class CaseStudiesHeader extends StatelessWidget {
  const CaseStudiesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'CASE STUDIES',
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'AN INSIDE LOOK AT',
          style: TextStyle(
            fontSize: 40,
            color: Color(0xFF3A3F47), // dark grey
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'SOME OF OUR PROJECTS',
          style: TextStyle(
            fontSize: 40,
            color: Color(0xFFF5A623), // yellow-orange
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}