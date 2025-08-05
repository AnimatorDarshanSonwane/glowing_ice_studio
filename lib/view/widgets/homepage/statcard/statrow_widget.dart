import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/statcard/statcard_widget.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  // Placeholder URL for images as per instructions
  static const String _placeholderImageUrl =
      'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        20,
      ), // Add margin to avoid cutting off shadows
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.white, // Strong at the top
            Color(
              0x00FFFFFF,
            ), // Fade out completely at the bottom (transparent white)
          ],
        ),
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFE0E0E0),
            offset: Offset(0, 8),
            blurRadius: 20,
          ),
        ],
      ),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: const [
          StatCard(
            iconPath: _placeholderImageUrl, // Use placeholder URL
            number: '300+',
            label: 'Team',
          ),
          StatCard(
            iconPath: _placeholderImageUrl, // Use placeholder URL
            number: '500+',
            label: 'Apps & Games',
          ),
          StatCard(
            iconPath: _placeholderImageUrl, // Use placeholder URL
            number: '10+',
            label: 'Years in Market',
          ),
          StatCard(
            iconPath: _placeholderImageUrl, // Use placeholder URL
            number: '10K+',
            label: 'Happy Clients',
          ),
        ],
      ),
    );
  }
}