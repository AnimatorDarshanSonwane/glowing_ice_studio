import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/data/models/feature_item_data.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/featurecard/feature_card_widget.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const BorderSide commonBorderSide = BorderSide(
      color: Colors.grey,
      width: 0.5,
    );

    final List<FeatureItem> featureItems = <FeatureItem>[
      FeatureItem(
        title: 'Tailored for all types of Clientele',
        description:
            'Our clientele is not limited to any industry or business size. In fact, we have worked across sectors such as gaming, entertainment, finance, healthcare, etc., providing a tailored customer experience.',
        imageUrl:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
        customBorder: const Border(
          right: commonBorderSide,
          bottom: commonBorderSide,
        ),
      ),
      FeatureItem(
        title: 'We know Everything about Games',
        description:
            'Years of experience in the industry have given us deep understanding of games. We offer valuable insights backed by solid experience and passion for gaming.',
        imageUrl:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
        customBorder: const Border(
          left: commonBorderSide,
          bottom: commonBorderSide,
        ),
      ),
      FeatureItem(
        title: 'Expertise Proven with Numbers',
        description:
            'Since 2011, we’ve completed 500+ projects with over 100 million downloads. Our track record is unmatched in the game dev industry.',
        imageUrl:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
        customBorder: const Border(
          top: commonBorderSide,
          right: commonBorderSide,
        ),
      ),
      FeatureItem(
        title: 'Result-Oriented Process',
        description:
            'We follow a structured, result-focused process to ensure top-notch delivery and client satisfaction at every step.',
        imageUrl:
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
        customBorder: const Border(
          top: commonBorderSide,
          left: commonBorderSide,
        ),
      ),
    ];

    return Column(
      children: <Widget>[
        // First Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: FeatureCard(
                title: featureItems[0].title,
                description: featureItems[0].description,
                imageUrl: featureItems[0].imageUrl,
                customBorder: featureItems[0].customBorder,
              ),
            ),
            Flexible(
              flex: 1,
              child: FeatureCard(
                title: featureItems[1].title,
                description: featureItems[1].description,
                imageUrl: featureItems[1].imageUrl,
                customBorder: featureItems[1].customBorder,
              ),
            ),
          ],
        ),
        // Second Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: FeatureCard(
                title: featureItems[2].title,
                description: featureItems[2].description,
                imageUrl: featureItems[2].imageUrl,
                customBorder: featureItems[2].customBorder,
              ),
            ),
            Flexible(
              flex: 1,
              child: FeatureCard(
                title: featureItems[3].title,
                description: featureItems[3].description,
                imageUrl: featureItems[3].imageUrl,
                customBorder: featureItems[3].customBorder,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
