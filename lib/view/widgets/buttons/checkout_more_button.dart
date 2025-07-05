import 'package:flutter/material.dart';

class CheckoutMoreButton extends StatelessWidget {
  const CheckoutMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 24.0;
    // Define how much the second arrow should overlap the first one.
    // A positive value means overlap, reducing the effective width.
    const double arrowOverlap = 15;

    // Calculate the total width required for the two overlapping arrows.
    // It's the width of one icon plus the remaining visible portion of the second icon.
    final double stackedArrowsWidth = iconSize + (iconSize - arrowOverlap);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          'CHECKOUT MORE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black,
            letterSpacing: 0.3,
          ),
        ),
        // Use a SizedBox with a Stack to precisely control the overlap of the two arrows.
        SizedBox(
          width: stackedArrowsWidth,
          height: iconSize, // Height matches the icon size
          child: Stack(
            children: <Widget>[
              // First arrow positioned at the beginning of the Stack.
              const Positioned(
                left: 0,
                child: Icon(
                  Icons.chevron_right,
                  color: Color(0xFFFFA500), // Orange
                  size: iconSize,
                ),
              ),
              // Second arrow positioned to overlap the first one.
              // Its 'left' position is calculated to achieve the desired overlap.
              Positioned(
                left: iconSize - arrowOverlap,
                child: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFFFFA500), // Orange
                  size: iconSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
