import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glowing_ice_studio/view/widgets/buttons/custom_chevron_nav_button.dart';

class AutoScrollCarousel extends StatefulWidget {
  const AutoScrollCarousel({super.key});

  @override
  State<AutoScrollCarousel> createState() => _AutoScrollCarouselState();
}

class _AutoScrollCarouselState extends State<AutoScrollCarousel> {
  final int _initialPageOffset = 1000;
  late final PageController _pageController;
  late Timer _timer;
  bool _isAutoScrolling = true;

  final List<String> _imagePaths = [
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _imagePaths.length * _initialPageOffset,
      viewportFraction: 0.2,
    );
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _isAutoScrolling = true;
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients && _isAutoScrolling) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 1600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoScroll() {
    if (_isAutoScrolling) {
      _isAutoScrolling = false;
      _timer.cancel();
    }
  }

  void _restartAutoScrollDelayed() {
    _timer.cancel(); // Cancel any existing auto-scroll timer immediately
    Future.delayed(const Duration(seconds: 2), () {
      // Only restart auto-scroll if it's currently stopped and the widget is still mounted
      if (mounted && !_isAutoScrolling) {
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is UserScrollNotification) {
            if (notification.direction != ScrollDirection.idle) {
              _stopAutoScroll();
            } else {
              _restartAutoScrollDelayed();
            }
          }
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              itemCount: null, // Infinite scroll
              itemBuilder: (BuildContext context, int index) {
                final int actualIndex = index % _imagePaths.length;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    _imagePaths[actualIndex],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),

            CustomChevronNavButton(
              alignment: Alignment.centerRight,
              isForward: true,
              onTap: () {
                _stopAutoScroll();
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeInOut,
                );
                _restartAutoScrollDelayed();
              },
            ),

            CustomChevronNavButton(
              alignment: Alignment.centerLeft,
              isForward: false,
              onTap: () {
                _stopAutoScroll();
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeInOut,
                );
                _restartAutoScrollDelayed();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final Alignment alignment;

  const NavButton({
    required this.iconData,
    required this.onPressed,
    required this.alignment,
    super.key,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovering = false;
  Color _backgroundColor = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovering = true),
          onExit: (_) => setState(() => _isHovering = false),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 200,
            ), // Duration for smooth background transition
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: _backgroundColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                widget.iconData,
                color: _isHovering ? Colors.yellow : Colors.white,
              ),
              onPressed: () {
                // Animate background color on press
                setState(() {
                  _backgroundColor = Colors.black; // Darker on press
                });
                widget.onPressed(); // Execute the provided callback

                // After a short delay, revert background color
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (mounted) {
                    // Ensure the widget is still in the tree
                    setState(() {
                      _backgroundColor = Colors.black54; // Revert to original
                    });
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
