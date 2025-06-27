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

  void _handleMouseExit() {
    setState(() => _controller.isHovered = false);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted && _controller.overlayEntry != null) {
        _controller.removeDropdown();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color hoverColor = _controller.isHovered
        ? const Color(0xFFFF9100)
        : Colors.white;

    final String lowerTitle = widget.item.title.toLowerCase();

    final bool showDropdownIcon =
        widget.item.hasDropdown &&
        lowerTitle != 'case studies' &&
        lowerTitle != 'blog';

    return MouseRegion(
      onEnter: (_) => _handleMouseEnter(context),
      onExit: (_) => _handleMouseExit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
              Icon(Icons.arrow_drop_down, color: hoverColor, size: 18),
            ],
          ],
        ),
      ),
    );
  }
}
