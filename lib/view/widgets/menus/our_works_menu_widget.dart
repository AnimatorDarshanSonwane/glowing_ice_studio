import 'package:flutter/material.dart';

class OurWorksMenuWidget extends StatelessWidget {
  final List<String> items;
  final void Function(String)? onItemSelected;

  const OurWorksMenuWidget({
    super.key,
    required this.items,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.85),
          border: const Border(
            top: BorderSide(color: Color(0xFFFF9100), width: 2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return InkWell(
              onTap: () => onItemSelected?.call(item),
              hoverColor: Colors.orange.withOpacity(0.1),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Text(
                  item.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
