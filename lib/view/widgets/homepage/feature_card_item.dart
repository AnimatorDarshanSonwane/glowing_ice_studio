import 'package:flutter/material.dart';

class FeatureCardItem extends StatefulWidget {
  final String number;
  final String title;
  final String description;
  final double cardWidth;
  final double cardHeight;
  final bool isHovered;
  final VoidCallback onHoverStart;
  final VoidCallback onHoverEnd;
  final int index;

  const FeatureCardItem({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.cardWidth,
    required this.cardHeight,
    required this.isHovered,
    required this.onHoverStart,
    required this.onHoverEnd,
    required this.index,
  });

  @override
  State<FeatureCardItem> createState() => _FeatureCardItemState();
}

class _FeatureCardItemState extends State<FeatureCardItem> {
  @override
  Widget build(BuildContext context) {
    BorderRadius? cardBorderRadius;
    const Radius defaultRadius = Radius.circular(25.0);
    const Radius zeroRadius = Radius.zero;

    if (widget.index == 0) {
      cardBorderRadius = const BorderRadius.only(
        topLeft: defaultRadius,
        bottomLeft: defaultRadius,
        bottomRight: defaultRadius,
        topRight: zeroRadius,
      );
    } else if (widget.index == 1) {
      cardBorderRadius = const BorderRadius.only(
        topLeft: defaultRadius,
        topRight: defaultRadius,
        bottomRight: defaultRadius,
        bottomLeft: zeroRadius,
      );
    } else if (widget.index == 2) {
      cardBorderRadius = const BorderRadius.only(
        topLeft: zeroRadius,
        topRight: defaultRadius,
        bottomRight: defaultRadius,
        bottomLeft: defaultRadius,
      );
    } else if (widget.index == 3) {
      cardBorderRadius = const BorderRadius.only(
        topLeft: defaultRadius,
        topRight: zeroRadius,
        bottomRight: defaultRadius,
        bottomLeft: defaultRadius,
      );
    }

    return SizedBox(
      width: widget.cardWidth,
      height: widget.cardHeight,
      child: MouseRegion(
        onEnter: (_) => widget.onHoverStart(),
        onExit: (_) => widget.onHoverEnd(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey[100]!, Colors.grey[300]!],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.isHovered ? Colors.black45 : Colors.black26,
                blurRadius: widget.isHovered ? 16 : 10,
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: cardBorderRadius,
            border: Border.all(color: Colors.white, width: 2.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.number,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFA500),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
