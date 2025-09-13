import 'dart:math';
import '../../data/models/drink_analysis.dart';

class AIService {
  static final List<DrinkAnalysis> _mockAnalyses = [
    DrinkAnalysis(
      drinkName: 'Water',
      drinkType: 'Water',
      volume: 16.0,
      calories: 0,
      sugar: 0.0,
      healthScore: 10,
      recommendation: 'Perfect choice! Water is the best for hydration. Keep it up!',
    ),
    DrinkAnalysis(
      drinkName: 'Coffee',
      drinkType: 'Coffee',
      volume: 12.0,
      calories: 5,
      sugar: 0.0,
      healthScore: 7,
      recommendation: 'Good choice for energy! Try to limit to 2-3 cups per day.',
    ),
    DrinkAnalysis(
      drinkName: 'Orange Juice',
      drinkType: 'Juice',
      volume: 8.0,
      calories: 110,
      sugar: 22.0,
      healthScore: 6,
      recommendation: 'Good for vitamin C, but high in natural sugars. Enjoy in moderation.',
    ),
    DrinkAnalysis(
      drinkName: 'Soda',
      drinkType: 'Soda',
      volume: 12.0,
      calories: 150,
      sugar: 39.0,
      healthScore: 3,
      recommendation: 'High in sugar. Consider water or unsweetened drinks instead.',
    ),
  ];

  static Future<DrinkAnalysis> analyzeDrink() async {
    // Simulate AI processing delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Return random analysis for demo
    final random = Random();
    return _mockAnalyses[random.nextInt(_mockAnalyses.length)];
  }
}