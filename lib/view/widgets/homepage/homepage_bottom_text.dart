import 'package:flutter/material.dart';

class HomepageBottomText extends StatelessWidget {
  const HomepageBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity ,
      margin: const EdgeInsets.only(top: 850), // Adjust margin to position text
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black.withOpacity(0.8), // Semi-transparent background
      child: Row(
        children: [
          // Completed Projects
          Expanded(
            flex: 2, // Adjust flex to control width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  '500+',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Completed Projects',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.cyanAccent,
                  ),
                ),
              ],
            ),
          ),

          // Downloads
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '100+ M',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Downloads',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.cyanAccent,
                  ),
                ),
              ],
            ),
          ),

          // Request a Quote Button
          Container(
            height: 45,
            margin: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107), // Yellow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              child: Row(
                children: const [
                  Text(
                    'REQUEST A QUOTE',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.chevron_right, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
