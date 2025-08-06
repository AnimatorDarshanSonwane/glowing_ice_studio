import 'package:flutter/material.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculated height for the main card to match the combined height of two small cards plus spacing.
    // Small Card Image Height: 130
    // Small Card Text Container Height (approx): 8 (top padding) + ~20 (text) + 8 (bottom padding) = 36
    // Total Small Card Height: 130 + 36 = 166
    // Two Small Cards Height: 166 + 166 = 332
    // Spacing between two small cards: 16
    // Total right column height: 332 + 16 = 348
    const double mainCardHeight = 348.0;

    return Column(
      children: [
        // Row of Main Card and Two Side Cards
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left large card (Medals of War)
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Removed ClipRRect to remove corner radius
                    Stack(
                      children: [
                        Image.network(
                          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
                          fit: BoxFit.cover,
                          height: mainCardHeight, // Adjusted height
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.black.withAlpha(179),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MEDALS OF WAR',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Medals of War is a strategy game with a military theme. Players '
                                  'command their own armies using different types of troops and '
                                  'compete against one another in PvP battles.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right side (2 smaller cards)
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    // 3D Organon
                    SmallCardWidget(
                      imagePath:
                          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
                      title: '3D ORGANON',
                    ),
                    const SizedBox(height: 16),
                    // United Airlines
                    SmallCardWidget(
                      imagePath:
                          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
                      title: 'UNITED AIRLINES',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16), // Space between cards and button
        // View More Button moved to the right bottom corner
        Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
            bottom: 16.0,
          ), // Padding from right and bottom edges
          child: Align(
            alignment: Alignment.centerRight, // Aligns content to the right
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward, color: Colors.orange),
              label: const Text(
                'VIEW MORE',
                style: TextStyle(color: Colors.orange),
              ),
              style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.orange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// New Widget for Small Cards
class SmallCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const SmallCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Removed ClipRRect to remove corner radius
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          imagePath,
          fit: BoxFit.cover,
          height: 130,
          width: double.infinity,
        ),
        Container(
          color: Colors.blueGrey.shade400,
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
