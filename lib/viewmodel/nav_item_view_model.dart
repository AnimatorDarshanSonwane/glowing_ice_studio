import 'package:flutter/foundation.dart';

class NavItemViewModel {

  final List<String> servicesPrimaryItems = [
  'Game Development Services',
  'Game Art Services',
  'Resource Augmentation',
  'VR/XR Simulation',
];

final List<String> servicesSecondaryItems = [
  '2D Game Art',
  '3D Game Art',
  'Character Design',
  'Game Animation',
  'UI/UX',
  'AAA Game Art',
  'Slot Game Art',
  'Environment Design',
];

  final List<String> ourWorksItems = [
    'Games',
    'Art & Design',
    'Kid Games',
    'VR/XR',
    'Metaverse',
    'NFT & Blockchain',
    'Gamification',
  ];

  final List<String> industriesItems = [
    'Metaverse Solutions',
    'Heavy Industry Solutions',
    'Edutainment Solutions',
    'Banking Solutions',
    'Aviation & Automotive Solutions',
    'Media & Branding Solutions',
  ];

  final List<String> aboutUsItems = [
  'Overview',
  'Careers',
  'Clientele',
  'Testimonials',
];

  void handleItemSelected(String item) {
    // Add routing or logic
    if (kDebugMode) {
      print('Selected item: $item');
    }
  }

  List<String> getItemsFor(String navTitle) {
  switch (navTitle.toLowerCase()) {
    case 'services':
      return [...servicesPrimaryItems, ...servicesSecondaryItems];
    case 'our works':
      return ourWorksItems;
    case 'industries':
      return industriesItems;
    case 'about us':
      return aboutUsItems;
    case 'case studies':
    case 'blog':
      return []; // explicitly return empty list (no dropdown)
    default:
      return [];
  }
}
}
