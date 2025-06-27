import 'package:flutter/material.dart';

class ServicesMenuWidget extends StatefulWidget {
  final List<String> primary;
  final List<String> secondary;
  final VoidCallback onExplore;
  final VoidCallback onViewMore;

  const ServicesMenuWidget({
    super.key,
    required this.primary,
    required this.secondary,
    required this.onExplore,
    required this.onViewMore, required List<String> items, required Null Function(dynamic item) onItemSelected,
  });

  @override
  State<ServicesMenuWidget> createState() => _ServicesMenuWidgetState();
}

class _ServicesMenuWidgetState extends State<ServicesMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1F1F1F),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Primary (Left side)
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.primary.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.videogame_asset, size: 16, color: Color(0xFFFF9100)), // Replace with correct icons
                          const SizedBox(width: 8),
                          Text(
                            item,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 32),
              // Secondary (Right side)
              Expanded(
                flex: 3,
                child: Wrap(
                  spacing: 32,
                  runSpacing: 12,
                  children: widget.secondary.map((item) {
                    return Text(
                      item,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: widget.onExplore,
                  child: const Text(
                    "Explore our Services",
                    style: TextStyle(
                      color: Color(0xFFFF9100),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: widget.onViewMore,
                  child: const Text("VIEW MORE"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
