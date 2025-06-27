import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/data/models/nav_item_model.dart';
import 'package:glowing_ice_studio/view/widgets/hiring_badge.dart';
import 'package:glowing_ice_studio/view/widgets/top_appbar_widgets/nav_item_widget.dart';
import '../../data/models/nav_item_data.dart';

class TopAppBarWidget extends StatelessWidget {
  final double backgroundOpacity;

  const TopAppBarWidget({super.key, required this.backgroundOpacity});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(backgroundOpacity),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),

          // Center nav items with logo
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo_01.png', height: 40),
                  const SizedBox(width: 24),

                  ...navItems.map((item) {
                    if (item.title == "ABOUT US") {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            
                            // The floating hiring badge with hover logic preserved
                            const Positioned(
                              top: 5,
                              child:
                                  HiringBadge(), // Contains its own MouseRegion internally
                            ),

                            // "ABOUT US" item — stays vertically aligned like "BLOG"
                            Align(
                              alignment: Alignment.center,
                              child: NavItemWidget(
                                item: NavItemModel(
                                  title: "ABOUT US",
                                  hasDropdown: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return NavItemWidget(item: item);
                  }),
                ],
              ),
            ),
          ),

          const SizedBox(width: 16),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[700],
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'CONTACT US',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
