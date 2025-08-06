import 'package:flutter/material.dart';

class CheckoutMoreButton extends StatelessWidget {
  const CheckoutMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    const Color buttonColor = Color(0xFFE0A341);
    const double borderRadiusValue = 9999.0;

    return OutlinedButton(
      onPressed: () {
        debugPrint('Checkout More button tapped!');
      },
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(buttonColor),
        side: WidgetStatePropertyAll(
          BorderSide(color: buttonColor, width: 2),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue)),
          ),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('CHECKOUT MORE'),
          SizedBox(width: 8),
          Icon(Icons.double_arrow_sharp, color: buttonColor, size: 24),
        ],
      ),
    );
  }
}
