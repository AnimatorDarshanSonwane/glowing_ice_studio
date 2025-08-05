import 'package:flutter/material.dart';

class GameCategoryCard extends StatefulWidget {
  final String imagePath;
  final String category;
  final String title;
  final String subtitle;

  const GameCategoryCard({
    super.key,
    required this.imagePath,
    required this.category,
    required this.title,
    required this.subtitle,
  });

  @override
  State<GameCategoryCard> createState() => _GameCategoryCardState();
}

class _GameCategoryCardState extends State<GameCategoryCard> {
  bool _isHovered = false;
  static const double _cardWidth = 220; // Define the card width as a constant
  static const double _hoverScale = 1.05; // Scale factor for hover effect

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _cardWidth, // Use the constant width for the card
        height: 320,
        // Apply scaling transformation
        transform: _isHovered
            ? Matrix4.diagonal3Values(_hoverScale, _hoverScale, 1.0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? Colors.black38 : Colors.black12,
              blurRadius: _isHovered ? 20 : 12,
              offset: _isHovered ? const Offset(0, 8) : const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // Game Image
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    widget.imagePath,
                    height: 240,
                    width: double
                        .infinity, // Image fills the stack's width (_cardWidth)
                    fit: BoxFit.cover,
                  ),
                ),
                // Hover Overlay
                Positioned.fill(
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment:
                        _isHovered ? Alignment.center : Alignment.bottomCenter,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isHovered ? 1.0 : 0.0,
                      child: Container(
                        // Explicitly set the width of the hover overlay to match the card's width
                        width: _cardWidth,
                        height: 82, // Increased height to prevent text overflow
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        color: const Color.fromRGBO(0, 0, 0, 0.7),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Center contents vertically
                          children: [
                            Text(
                              widget.title.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.subtitle,
                              textAlign: TextAlign.center, // Center the subtitle
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Category Label
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                widget.category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}