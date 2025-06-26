import 'package:flutter/material.dart';
import '../../../data/models/nav_item_model.dart';

class NavItemWidget extends StatelessWidget {
  final NavItemModel item;

  const NavItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Text(
            item.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (item.hasDropdown) ...[
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, color: Colors.white, size: 18),
          ]
        ],
      ),
    );
  }
}
