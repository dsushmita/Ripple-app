import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/ai_service.dart';
import '../../../data/models/drink_analysis.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _isAnalyzing = false;
  DrinkAnalysis? _analysis;

  Future<void> _captureAndAnalyze() async {
    setState(() {
      _isAnalyzing = true;
      _analysis = null;
    });

    // Simulate camera capture and AI analysis
    final analysis = await AIService.analyzeDrink();
    
    setState(() {
      _analysis = analysis;
      _isAnalyzing = false;
    });
  }

  void _logDrink() {
    if (_analysis != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${_analysis!.drinkName} logged successfully! +${_analysis!.volume.toInt()} oz'),
          backgroundColor: AppColors.primary,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'AI Drink Scanner',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            
            // Content Area
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _analysis != null ? Colors.white : Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _buildContent(),
              ),
            ),
            
            // Controls
            if (_analysis == null) _buildCameraControls(),
            if (_analysis != null) _buildAnalysisControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isAnalyzing) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColors.primary),
            SizedBox(height: 20),
            Text(
              'AI is analyzing your drink...',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      );
    }

    if (_analysis != null) {
      return _buildAnalysisResult();
    }

    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'Tap capture to analyze your drink\nwith AI technology',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisResult() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drink Name & Health Score
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _analysis!.drinkName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildHealthScore(_analysis!.healthScore),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _analysis!.drinkType,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          
          // Nutrition Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNutritionItem('Volume', '${_analysis!.volume.toInt()} oz', Icons.local_drink),
              _buildNutritionItem('Calories', '${_analysis!.calories}', Icons.local_fire_department),
              _buildNutritionItem('Sugar', '${_analysis!.sugar.toInt()}g', Icons.cake),
            ],
          ),
          const SizedBox(height: 20),
          
          // AI Recommendation
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.psychology, color: AppColors.primary),
                    SizedBox(width: 8),
                    Text(
                      'AI Insight',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(_analysis!.recommendation),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthScore(int score) {
    Color color = Colors.red;
    if (score >= 8) color = Colors.green;
    else if (score >= 6) color = Colors.orange;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, color: color, size: 16),
          const SizedBox(width: 4),
          Text(
            '$score/10',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildCameraControls() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.flash_off, color: Colors.white, size: 32),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: _isAnalyzing ? null : _captureAndAnalyze,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: _isAnalyzing ? Colors.grey : Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.camera, size: 40, color: Colors.black),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.flip_camera_ios, color: Colors.white, size: 32),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisControls() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _analysis = null;
                  _isAnalyzing = false;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
              ),
              child: const Text(
                'Retake',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: _logDrink,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: const Text(
                'Log This Drink',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}