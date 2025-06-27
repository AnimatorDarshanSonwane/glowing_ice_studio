import 'package:flutter/material.dart';
import '../../../data/models/nav_item_model.dart';
import '../../../controller/nav_item_controller.dart';

class NavItemWidget extends StatefulWidget {
  final NavItemModel item;

  const NavItemWidget({super.key, required this.item});

  @override
  State<NavItemWidget> createState() => _NavItemWidgetState();
}

class _NavItemWidgetState extends State<NavItemWidget> {
  final NavItemController _controller = NavItemController();

  void _handleMouseEnter(BuildContext context) {
    setState(() => _controller.isHovered = true);

    if (widget.item.hasDropdown && _controller.overlayEntry == null) {
      final renderBox = context.findRenderObject() as RenderBox;
      _controller.showDropdown(
        context: context,
        renderBox: renderBox,
        navTitle: widget.item.title,
        removeOverlay: () => setState(() {
          _controller.removeDropdown();
        }),
      );
    }
  }


  @override
Widget build(BuildContext context) {
  final Color hoverColor =
      _controller.isHovered ? const Color(0xFFFF9100) : Colors.white;

  final String lowerTitle = widget.item.title.toLowerCase();
  final bool isSpecialCase = lowerTitle == 'case studies' || lowerTitle == 'blog';
  final bool showDropdownIcon = widget.item.hasDropdown &&
      lowerTitle != 'case studies' &&
      lowerTitle != 'blog';

  return MouseRegion(
    onEnter: (_) {
      _controller.isHovered = true;
      _handleMouseEnter(context);
    },
    onExit: (_) {
  _controller.isHovered = false;
  _controller.isDropdownHovered = false; // <-- Ensure both are false
  Future.delayed(const Duration(milliseconds: 200), () {
    if (!_controller.isHovered && !_controller.isDropdownHovered && mounted) {
      _controller.isHovered = false; // Reset hovered state
      _controller.removeDropdown();
      setState(() {});
      //debugPrint('not hovered and not dropdown hovered, removing dropdown widget');
    } else if (_controller.isHovered && _controller.isDropdownHovered) {
      _controller.isHovered = true; // Keep hovered state if still hovering
      setState(() {}); // Ensure the widget rebuilds to reflect the state
      //debugPrint('hovered and dropdown hovered, keeping dropdown open wigiets');
    } else if (_controller.isHovered && !_controller.isDropdownHovered) {
      _controller.isHovered = false; // Keep hovered state if still hovering
      setState(() {}); // Ensure the widget rebuilds to reflect the state
      //debugPrint('hovered but not dropdown hovered, keeping dropdown open widget');
    }else if (_controller.isHovered && !_controller.isDropdownHovered) {
      _controller.isHovered = false; // Keep hovered state if still hovering
      setState(() {}); // Ensure the widget rebuilds to reflect the state
    }
    
  });
},

    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 70, // 
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _controller.isHovered && !isSpecialCase
                  ? const Color(0xFFFF9100)
                  : Colors.transparent,
              width: 5,
            ),
          ),
          ),
        child: Row(
          children: [
            Text(
              widget.item.title,
              style: TextStyle(
                color: hoverColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (showDropdownIcon) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down,
                color: hoverColor,
                size: 18,
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
}
