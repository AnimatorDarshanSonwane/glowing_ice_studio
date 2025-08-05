import 'package:flutter/material.dart';

class GamePortfolioTitle extends StatelessWidget {
  const GamePortfolioTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'YourCustomFont', // optional
          letterSpacing: 1.5,
        ),
        children: [
          TextSpan(
            text: 'OUR ',
            style: TextStyle(
              color: Color(0xFF3F444A), // Dark gray
            ),
          ),
          TextSpan(
            text: 'GAME PORTFOLIO',
            style: TextStyle(
              color: Color(0xFFF6AC27), // Orange
            ),
          ),
        ],
      ),
    );
  }
}
