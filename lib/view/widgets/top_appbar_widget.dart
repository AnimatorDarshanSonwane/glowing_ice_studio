import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/view/widgets/top_appbar_widgets/nav_item_widget.dart';
import '../../data/models/nav_item_data.dart'; // Import the list
// Import the model

class TopAppBarWidget extends StatelessWidget {

  final double backgroundOpacity;

  const TopAppBarWidget({super.key, required this.backgroundOpacity});

  @override
Widget build(BuildContext context) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300), // Smooth fade
    height: 100,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    decoration: BoxDecoration(
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(backgroundOpacity), // 👈 Fade only this
      // borderRadius: BorderRadius.circular(20), // Rounded all corners
      // To round only top or bottom corners:
      borderRadius: BorderRadius.only(
      //   topLeft: Radius.circular(20),
      //   topRight: Radius.circular(20),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 20),

        Expanded(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/images/logo_01.png',
        height: 40,
      ),
      const SizedBox(width: 24),

      ...navItems.map((item) => NavItemWidget(item: item)).toList(),
    ],
  ),
),

        const SizedBox(width: 16),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            "We're Hiring!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(width: 16),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber[700],
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'CONTACT US',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
}


