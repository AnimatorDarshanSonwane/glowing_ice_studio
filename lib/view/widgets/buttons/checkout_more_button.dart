import 'package:flutter/material.dart';

class CheckoutMoreButton extends StatelessWidget {
  const CheckoutMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Define what happens when the button is pressed.
        // For example, navigate to a new screen or perform an action.
        print('Checkout More button pressed!');
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // Rounded corners
          side: const BorderSide(
            color: Colors.orange,
            width: 2.0,
          ), // Orange border
        ),
        foregroundColor: Colors.orange, // Text and icon color
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min, // Ensures the row takes minimum space
        children: [
          Text('CHECKOUT MORE', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 8.0), // Space between text and icon
          Icon(Icons.arrow_right_alt_sharp,  color: Colors.orange), // Double arrow icon
        ],
      ),
    );
  }
}
