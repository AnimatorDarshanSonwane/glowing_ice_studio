import 'package:flutter/material.dart';

class ExecuteGameIdeaWidget extends StatelessWidget {
  const ExecuteGameIdeaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF161823), // Dark background
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "EXECUTE YOUR GAME IDEA",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "WITH OUR GAME DEVELOPMENT STUDIO!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFA726), // Highlighted orange text
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Share with us the idea you have. Our team will analyze your requirements, explain how we can help you realize your vision, and provide a comprehensive cost and effort estimate.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Define button action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA726), // Orange color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              elevation: 5,
            ),
            child: const Text(
              "Talk to Our Experts",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
