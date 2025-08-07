import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/data/models/awardsection/award_data.dart';
import 'package:glowing_ice_studio/data/models/awardsection/clientlogo_data.dart';
import 'package:provider/provider.dart';

/// A horizontally auto-scrolling banner displaying client logos.
class AutoScrollingLogoBanner1 extends StatefulWidget {
  const AutoScrollingLogoBanner1({super.key});

  @override
  State<AutoScrollingLogoBanner1> createState() =>
      _AutoScrollingLogoBannerState();
}

class _AutoScrollingLogoBannerState extends State<AutoScrollingLogoBanner1>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  final double _scrollSpeed = 50;

  String get _placeholderImageUrl =>
      'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'; // pixels per second

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _animationController =
        AnimationController(
          vsync: this,
          duration: const Duration(hours: 1), // Long duration for looping
        )..addListener(() {
          if (_scrollController.hasClients) {
            final double maxScrollExtent =
                _scrollController.position.maxScrollExtent;
            if (maxScrollExtent > 0) {
              double nextOffset =
                  _scrollController.offset +
                  (_scrollSpeed * (1 / 60)); // approx 60 FPS
              if (nextOffset >= maxScrollExtent) {
                nextOffset = 0; // Loop back
              }
              _scrollController.jumpTo(nextOffset);
            }
          }
        });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.repeat();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<ClientLogo> logoData = context.watch<AwardsData>().clientLogos;

    // Repeat logos to enable infinite scroll effect
    final List<ClientLogo> repeatedLogos = <ClientLogo>[];
    for (int i = 0; i < 10; i++) {
      repeatedLogos.addAll(logoData);
    }

    return Container(
      color: const Color.fromRGBO(71, 70, 92, 1),

      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            color: const Color.fromRGBO(71, 70, 92, 1),
            padding: const EdgeInsets.symmetric(horizontal: 400),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Static left image
                Image.network(
                  _placeholderImageUrl,
                  height: 260,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 50),

                // Scrolling logos
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: repeatedLogos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ClientLogo currentLogo = repeatedLogos[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.amber, // golden-like color
                                  width: 3,
                                ),
                              ),
                              child: Image.network(
                                currentLogo.imageUrl,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              currentLogo.name,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
