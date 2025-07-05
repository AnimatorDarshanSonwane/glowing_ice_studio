import 'package:flutter/material.dart';

class CustomChevronNavButton extends StatefulWidget {
  final Alignment alignment;
  final VoidCallback onTap;
  final bool isForward;

  const CustomChevronNavButton({
    required this.alignment,
    required this.onTap,
    required this.isForward,
    super.key,
  });

  static const double iconSize = 28;
  static const double arrowOverlap = 20;
  static const double stackedArrowsWidth =
      iconSize + (iconSize - arrowOverlap);

  @override
  State<CustomChevronNavButton> createState() =>
      _CustomChevronNavButtonState();
}

class _CustomChevronNavButtonState extends State<CustomChevronNavButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: CustomChevronNavButton.stackedArrowsWidth,
            height: CustomChevronNavButton.iconSize,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: Transform.rotate(
                    angle: widget.isForward ? 0 : 3.1416,
                    child: Icon(
                      Icons.chevron_right,
                      color: _isHovering ? const Color(0xFFFFA500) : Colors.white,
                      size: CustomChevronNavButton.iconSize,
                    ),
                  ),
                ),
                Positioned(
                  left: CustomChevronNavButton.iconSize -
                      CustomChevronNavButton.arrowOverlap,
                  child: Transform.rotate(
                    angle: widget.isForward ? 0 : 3.1416,
                    child: Icon(
                      Icons.chevron_right,
                      color: _isHovering ? const Color(0xFFFFA500) : Colors.white,
                      size: CustomChevronNavButton.iconSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
