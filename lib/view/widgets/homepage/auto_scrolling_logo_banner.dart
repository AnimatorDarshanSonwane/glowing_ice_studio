import 'package:flutter/material.dart';

class AutoScrollingLogoBanner extends StatefulWidget {
  const AutoScrollingLogoBanner({super.key});

  @override
  State<AutoScrollingLogoBanner> createState() => _AutoScrollingLogoBannerState();
}

class _AutoScrollingLogoBannerState extends State<AutoScrollingLogoBanner>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  final double _scrollSpeed = 50; // pixels per second
  final List<String> _logoPaths = [
    'assets/ea.png',
    'assets/tencent.png',
    'assets/gameloft.png',
    'assets/wb.png',
  ];

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(hours: 1),
    )..addListener(() {
        _scrollController.jumpTo(
          (_scrollController.offset + (_scrollSpeed * 1 / 60)).clamp(
            0.0,
            _scrollController.position.maxScrollExtent,
          ),
        );
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.repeat(period: const Duration(milliseconds: 16));
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
    final repeatedLogos = List.generate(10, (_) => _logoPaths).expand((e) => e).toList();

    return Column(
      children: [
        Container(
          
          
          width: 1200,
          height: 80,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Title
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, height: 1.2),
                  children: [
                    TextSpan(text: 'OUR ', style: TextStyle(color: Colors.black87)),
                    TextSpan(text: 'CLIENTS', style: TextStyle(color: Color(0xFFFFA500))),
                  ],
                ),
              ),
              const SizedBox(width: 30),
        
              // Scrolling logos
              Expanded(
                
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: repeatedLogos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.orange,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        repeatedLogos[index],
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          
         
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          height: 2,
          color: Colors.grey[600], // Divider line
        ),
      ],
    );
  }
}
