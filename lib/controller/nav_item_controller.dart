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
    required VoidCallback removeOverlay,
  }) {
    final offset = renderBox.localToGlobal(Offset.zero);
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: offset.dy + renderBox.size.height + 30,
          left: offset.dx,
          child: MouseRegion(
            onExit: (_) => removeOverlay(),
            child: OurWorksMenuWidget(
              items: viewModel.ourWorksItems,
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
