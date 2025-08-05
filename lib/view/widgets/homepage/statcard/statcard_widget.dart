import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String iconPath;
  final String number;
  final String label;

  const StatCard({
    super.key,
    required this.iconPath,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the appropriate widget for the icon based on iconPath.
    // This handles the case where iconPath might be an empty string (like a "null" icon)
    // or a URL that fails to load.
    Widget iconWidget;
    if (iconPath.isEmpty) {
      iconWidget = const Icon(
        Icons
            .image_not_supported, // Icon to display when no image path is provided
        color: Colors.orange,
        size: 30,
      );
    } else {
      iconWidget = Image.network(
        iconPath,
        height: 30,
        color: Colors.orange,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.error, // Icon to display if the network image fails to load
          color: Colors.orange,
          size: 30,
        ),
      );
    }

    // The inner Container with height: 130 and padding: EdgeInsets.all(16)
    // is constrained by its parent (the outer Container with height: 140 and padding: 10).
    // The outer Container offers its child (the inner Container) a max height of 140 - (2 * 10) = 120.
    // So, the inner Container effectively becomes 120px tall.
    // With its own padding of 16px top/bottom, the available vertical space for the Column is
    // 120 - (2 * 16) = 120 - 32 = 88 pixels.
    // The original Column content (icon, 12px SizedBox, Text, 4px SizedBox, Text) required ~92 pixels,
    // causing a 4-pixel overflow when constrained to 88 pixels.
    // To fix this, we reduce the SizedBox heights to make the content fit within 88 pixels.
    // Reducing 12px to 10px and 4px to 2px reduces the total content height by 4 pixels (16 -> 12),
    // bringing it down to ~88 pixels which fits perfectly.
    return Container(
      width: 140,
      height: 140,
      padding: const EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        color: const Color(
          0xFFF8F8F8,
        ),
        borderRadius: BorderRadius.circular(
          35,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(
              0xFFD0D0D0,
            ),
            offset: Offset(0, 6),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        width: 130,
        height: 130,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFE0E0E0),
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget, // Use the conditionally chosen icon widget
            const SizedBox(height: 10), // Reduced from 12 to 10
            Text(
              number,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 2), // Reduced from 4 to 2
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
