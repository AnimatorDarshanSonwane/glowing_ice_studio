import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/view/widgets/menus/our_works_menu_widget.dart';
import '../../viewmodel/nav_item_view_model.dart';

class NavItemController {
  bool isHovered = false;
  bool isDropdownHovered = false;
  OverlayEntry? overlayEntry;
  final NavItemViewModel viewModel = NavItemViewModel();

  void showDropdown({
    required BuildContext context,
    required RenderBox renderBox,
    required String navTitle,
    required VoidCallback removeOverlay,
  }) {
    final lowerTitle = navTitle.toLowerCase();
    // Skip dropdown for case studies and blog

    if (lowerTitle == 'case studies' || lowerTitle == 'blog') return;

    final items = viewModel.getItemsFor(navTitle);
    if (items.isEmpty) return;

    final offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: offset.dy + renderBox.size.height,
          left: offset.dx + 12,
          child: MouseRegion(
            onEnter: (_) {
              isDropdownHovered = true;
              isHovered = true;
            },
            onExit: (_) {
              isDropdownHovered = false;
              isHovered = false; // ← Ensuring reset here too
              Future.delayed(const Duration(milliseconds: 200), () {
                if (!isHovered && !isDropdownHovered ) {
                  removeOverlay();
                  isHovered = false; // Reset hovered state
                  removeDropdown();
                  
                  //debugPrint('not hovered and not dropdown hovered, removing dropdown');
                }
                else if (isHovered && !isDropdownHovered) {
                  isHovered = false; // Keep hovered state if still hovering
                  //debugPrint('hovered but not dropdown hovered, keeping dropdown open');
                }
                else if (!isHovered && isDropdownHovered) {
                  isHovered = false; // Keep hovered state if still hovering
                  //('not hovered but dropdown hovered, keeping dropdown open');
                }
                else if (isHovered && isDropdownHovered) {
                  isHovered = false; // Keep hovered state if still hovering
                  //debugPrint('hovered and dropdown hovered, keeping dropdown open');
                }
              });
            },
            child: OurWorksMenuWidget(
              items: items,
              onItemSelected: (item) {
                viewModel.handleItemSelected(item);
                removeDropdown();
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
