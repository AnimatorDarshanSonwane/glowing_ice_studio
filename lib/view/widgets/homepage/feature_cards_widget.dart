import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/viewmodel/feature_cards_view_model.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'feature_card_item.dart';

class FeatureCardsWidget extends StatefulWidget {
  const FeatureCardsWidget({super.key});

  @override
  State<FeatureCardsWidget> createState() => _FeatureCardsWidgetState();
}

class _FeatureCardsWidgetState extends State<FeatureCardsWidget> {
  int? _hoveredIndex;

  void _onHoverStart(int index) => setState(() => _hoveredIndex = index);

  void _onHoverEnd(int index) {
    if (_hoveredIndex == index) setState(() => _hoveredIndex = null);
  }

  @override
  Widget build(BuildContext context) {
    final cards = context.watch<FeatureCardsViewModel>().cards;

    if (cards.length < 4) {
      return const Center(child: Text('Not enough cards to display layout.'));
    }

    const double cardWidth = 270;
    const double cardHeight = 300;
    const double overlapX = 150;
    const double overlapY = 150;
    const double centerShift = 100;
    const double cornerAdjust = 50;
    const double hoverScale = 1.1;

    final basePositions = <Offset>[
      const Offset(80 - centerShift, -30),
      Offset(cardWidth - overlapX + centerShift, -50),
      Offset(80 - centerShift - cornerAdjust, 100 + cardHeight - overlapY),
      Offset(cardWidth - overlapX + centerShift + cornerAdjust - 100,
          80 + cardHeight - overlapY),
    ];

    final minX = basePositions.map((p) => p.dx).reduce(min);
    final maxX = basePositions.map((p) => p.dx + cardWidth).reduce(max);
    final minY = basePositions.map((p) => p.dy).reduce(min);
    final maxY = basePositions.map((p) => p.dy + cardHeight).reduce(max);

    final horizontalShift = (cardWidth * (hoverScale - 1.0)) / 2;
    final verticalShift = (cardHeight * (hoverScale - 1.0)) / 2;

    final stackWidth = (maxX - minX) + (2 * horizontalShift);
    final stackHeight = (maxY - minY) + (2 * verticalShift);

    List<Widget> stackChildren = List.generate(4, (i) {
      final isHovered = _hoveredIndex == i;
      final scale = isHovered ? hoverScale : 1.0;
      final width = cardWidth * scale;
      final height = cardHeight * scale;
      final offsetX = (cardWidth - width) / 2;
      final offsetY = (cardHeight - height) / 2;

      return AnimatedPositioned(
        key: ValueKey(i),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        left: (basePositions[i].dx - minX) + offsetX + horizontalShift,
        top: (basePositions[i].dy - minY) + offsetY + verticalShift,
        width: width,
        height: height,
        child: FeatureCardItem(
          number: cards[i].number,
          title: cards[i].title,
          description: cards[i].description,
          cardWidth: cardWidth,
          cardHeight: cardHeight,
          isHovered: isHovered,
          onHoverStart: () => _onHoverStart(i),
          onHoverEnd: () => _onHoverEnd(i),
          index: i,
        ),
      );
    });

    if (_hoveredIndex != null) {
      final hoveredCard = stackChildren.removeAt(_hoveredIndex!);
      stackChildren.add(hoveredCard);
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFA500), Color(0xFFFFD700)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: SizedBox(
          width: stackWidth,
          height: stackHeight,
          child: Stack(children: stackChildren),
        ),
      ),
    );
  }
}
