
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

  void handleItemSelected(String item) {
    // Add logic like navigation or logging
    print('Selected: $item');
  }
}
