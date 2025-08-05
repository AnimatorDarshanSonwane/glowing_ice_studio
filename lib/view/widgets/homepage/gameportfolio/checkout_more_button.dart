import 'package:flutter/material.dart';

class CheckoutMoreButton extends StatelessWidget {
  const CheckoutMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        side: const BorderSide(
          color: Color(0xFFE0A341), // Clearly visible orange border
          width: 2,                // Make border thicker if needed
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        backgroundColor: Colors.transparent, // Make sure background doesn't hide border
      ),
      onPressed: () {
        // Button action here
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'CHECKOUT MORE',
            style: TextStyle(
              color: Color(0xFFE0A341),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.double_arrow,
            color: Color(0xFFE0A341),
          ),
        ],
      ),
    );
  }
}
