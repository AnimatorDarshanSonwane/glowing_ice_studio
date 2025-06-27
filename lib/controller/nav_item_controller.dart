import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/view/widgets/menus/our_works_menu_widget.dart';
import '../../viewmodel/nav_item_view_model.dart';

class NavItemController {
  bool isHovered = false;
  OverlayEntry? overlayEntry;
  final NavItemViewModel viewModel = NavItemViewModel();

  void showDropdown({
    required BuildContext context,
    required RenderBox renderBox,
    required String navTitle,
    required VoidCallback removeOverlay,
  }) {
    final lowerTitle = navTitle.toLowerCase();

    // Skip dropdown for Case Studies and Blog
    if (lowerTitle == 'case studies' || lowerTitle == 'blog') return;

    final items = viewModel.getItemsFor(navTitle);
    if (items.isEmpty) return;

    final offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: offset.dy + renderBox.size.height + 30,
          left: offset.dx,
          child: MouseRegion(
            onExit: (_) => removeOverlay(),
            child: OurWorksMenuWidget(
              items: items,
              onItemSelected: (item) {
                viewModel.handleItemSelected(item);
                removeOverlay();
              },
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void removeDropdown() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}
