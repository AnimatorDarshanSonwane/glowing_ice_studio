import 'package:flutter/foundation.dart';

class NavItemViewModel {
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

  void handleItemSelected(String item) {
    // Add routing or logic
    if (kDebugMode) {
      print('Selected item: $item');
    }
  }

  List<String> getItemsFor(String navTitle) {
  switch (navTitle.toLowerCase()) {
    case 'our works':
      return ourWorksItems;
    case 'industries':
      return industriesItems;
    case 'case studies':
    case 'blog':
      return []; // explicitly return empty list (no dropdown)
    default:
      return [];
  }
}
}
