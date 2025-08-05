class GameCategory {
  final String categoryName; // e.g., 'MULTIPLAYER'
  final String cardTitle; // e.g., 'Multiplayer Games'
  final String cardSubtitle; // e.g., 'Engage in online battles.'
  final String imagePath;

  const GameCategory({
    required this.categoryName,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.imagePath,
  });
}