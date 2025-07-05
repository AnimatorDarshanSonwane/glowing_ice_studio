import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/data/models/featured_card_data.dart';

class FeatureCardsViewModel extends ChangeNotifier {
  final List<FeatureCardData> _cards;

  FeatureCardsViewModel()
      : _cards = <FeatureCardData>[
          const FeatureCardData(
            number: '01',
            title: 'A DECADE OF EXCELLENCE',
            description:
                'We are not novices but veterans - as we have been creating games for over a decade...',
          ),
          const FeatureCardData(
            number: '02',
            title: 'END-TO-END GAME DEVELOPMENT',
            description:
                'Juego is experts from all domains of game development...',
          ),
          const FeatureCardData(
            number: '03',
            title: 'FULLY-FLEDGED ART & DESIGN TEAM',
            description:
                'Juego has a complete game art team. This includes concept artists, modelers...',
          ),
          const FeatureCardData(
            number: '04',
            title: 'LIVE OPERATIONS & SUPPORT',
            description:
                'We help you generate maximum revenue through data-analysis...',
          ),
        ];

  List<FeatureCardData> get cards => List.unmodifiable(_cards);
}
