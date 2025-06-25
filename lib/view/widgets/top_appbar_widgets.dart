import 'package:flutter/material.dart';

class TopAppBarWidget extends StatelessWidget {
  const TopAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Spacer before nav
          const SizedBox(width: 20),

          // Navigation Menu with Logo in between
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo placed here near SERVICES
                Image.asset(
                  'lib/assets/images/logo_01.png', // Make sure this path is correct
                  height: 40,
                ),
                const SizedBox(width: 24),

                _NavItem(title: 'SERVICES'),
                _NavItem(title: 'OUR WORKS'),
                _NavItem(title: 'CASE STUDIES'),
                _NavItem(title: 'INDUSTRIES'),
                _NavItem(title: 'BLOG'),
                _NavItem(title: 'ABOUT US'),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // "We're Hiring!" Tag
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

          // Contact Us Button
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


class _NavItem extends StatelessWidget {
  final String title;

  const _NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_drop_down, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}
