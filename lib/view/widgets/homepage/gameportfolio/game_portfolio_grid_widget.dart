import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/data/models/game_category_data.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/gameportfolio/game_category_card_widget.dart';

class GamePortfolioGrid extends StatelessWidget {
  final List<GameCategory> categories = const [
    GameCategory(
        categoryName: 'MULTIPLAYER',
        cardTitle: 'Multiplayer Games',
        cardSubtitle: 'Connect and compete with players worldwide.',
        imagePath:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
    GameCategory(
        categoryName: 'CONSOLE',
        cardTitle: 'Console Classics',
        cardSubtitle: 'Experience iconic titles from console gaming.',
        imagePath:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
    GameCategory(
        categoryName: 'EDUCATIONAL',
        cardTitle: 'Learn & Play',
        cardSubtitle: 'Games that make learning fun and interactive.',
        imagePath:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
    GameCategory(
        categoryName: 'SPORTS SIMULATION',
        cardTitle: 'Realistic Sports',
        cardSubtitle: 'Immerse yourself in lifelike sports simulations.',
        imagePath:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
    GameCategory(
        categoryName: 'HYPER CASUAL',
        cardTitle: 'Quick & Fun',
        cardSubtitle: 'Simple, addictive games for short breaks.',
        imagePath:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
    GameCategory(
        categoryName: 'REAL TIME STRATEGY',
        cardTitle: 'Strategic Warfare',
        cardSubtitle: 'Command your armies in real-time battles.',
        imagePath:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
    GameCategory(
        categoryName: 'CARD AND SLOT',
        cardTitle: 'Casino Fun',
        cardSubtitle: 'Enjoy a variety of card and slot games.',
        imagePath:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
    GameCategory(
        categoryName: 'HTML5',
        cardTitle: 'Web-Based Games',
        cardSubtitle: 'Play instantly on any device.',
        imagePath:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
  ];

  const GamePortfolioGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: categories
          .map<Widget>((GameCategory gameCategoryItem) => GameCategoryCard(
                imagePath: gameCategoryItem.imagePath,
                category: gameCategoryItem.categoryName,
                title: gameCategoryItem.cardTitle,
                subtitle: gameCategoryItem.cardSubtitle,
              ))
          .toList(),
    );
  }
}
