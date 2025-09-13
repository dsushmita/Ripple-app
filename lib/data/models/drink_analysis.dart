class DrinkAnalysis {
  final String drinkName;
  final String drinkType;
  final double volume;
  final int calories;
  final double sugar;
  final int healthScore;
  final String recommendation;

  DrinkAnalysis({
    required this.drinkName,
    required this.drinkType,
    required this.volume,
    required this.calories,
    required this.sugar,
    required this.healthScore,
    required this.recommendation,
  });
}