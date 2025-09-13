import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentStep = 0;
  final PageController _pageController = PageController();

  // User data
  int age = 22;
  String gender = 'Male';
  String height = '5FT';
  int weight = 70;
  String waterIntake = 'Less than 2 cups';
  String trackingMethod = 'I don\'t track';
  String healthGoal = 'Stay hydrated';
  String exerciseFrequency = 'Yes, daily';
  bool aiReminders = true;
  bool aiRecommendations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: List.generate(11, (index) { // Changed from 5 to 11
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: index <= currentStep ? Colors.black : Colors
                            .grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Content
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentStep = index;
                  });
                },
                children: [
                  _buildAgeStep(),
                  _buildGenderStep(),
                  _buildHeightStep(),
                  _buildWeightStep(),
                  _buildWaterIntakeStep(),
                  _buildTrackingMethodStep(), // New step 6
                  _buildHealthGoalsStep(), // New step 7
                  _buildExerciseStep(), // New step 8
                  _buildAIRemindersStep(), // New step 9
                  _buildAIRecommendationsStep(), // New step 10
                ],
              ),
            ),

            // Next button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentStep < 9) { // Changed from 4 to 9
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, '/rippl-score');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Next',
                    // Changed from 4 to 9
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgeStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Basic Profile Setup',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'What is your age?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 60),

          GestureDetector(
            onTap: () => _showAgePicker(),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '$age',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Years',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tap to change',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Basic Profile Setup',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'What\'s your gender?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => setState(() => gender = 'Male'),
                child: Container(
                  width: 100,
                  height: 140,
                  decoration: BoxDecoration(
                    color: gender == 'Male' ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 40,
                        color: gender == 'Male' ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Male',
                        style: TextStyle(
                          color: gender == 'Male' ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => gender = 'Female'),
                child: Container(
                  width: 100,
                  height: 140,
                  decoration: BoxDecoration(
                    color: gender == 'Female' ? AppColors.primary : Colors
                        .white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 40,
                        color: gender == 'Female' ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Female',
                        style: TextStyle(
                          color: gender == 'Female' ? Colors.white : Colors
                              .black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Other option
          GestureDetector(
            onTap: () => setState(() => gender = 'Other'),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: gender == 'Other' ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: gender == 'Other' ? Colors.white : Colors.grey,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Other',
                    style: TextStyle(
                      color: gender == 'Other' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeightStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Basic Profile Setup',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'What\'s your height?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 60),

          GestureDetector(
            onTap: () => _showHeightPicker(),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  height,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Feet',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tap to change',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Basic Profile Setup',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'What\'s your weight range?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 60),

          GestureDetector(
            onTap: () => _showWeightPicker(),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFFF7DC6F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '$weight',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'kg',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tap to change',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterIntakeStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Hydration & Drink Habits',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'How much water do you think you drink daily?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),

          Column(
            children: [
              'Less than 2 cups',
              '2-4 cups',
              '5-7 cups',
              '8+ cups',
            ].map((option) =>
                GestureDetector(
                  onTap: () => setState(() => waterIntake = option),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: waterIntake == option ? AppColors.primary : Colors
                          .white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      option,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: waterIntake == option ? Colors.white : Colors
                            .black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )).toList(),
          ),
        ],
      ),
    );
  }


  // NEW STEP 7: Tracking Method
  Widget _buildTrackingMethodStep() {
    final trackingOptions = [
      {'title': 'I don\'t track', 'icon': Icons.close},
      {'title': 'I use an app', 'icon': Icons.phone_android},
      {'title': 'I just Estimate', 'icon': Icons.quiz},
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Hydration & Drink Habits',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'How do you usually track your drinks?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 60),

          Column(
            children: trackingOptions.map((option) {
              final isSelected = trackingMethod == option['title'];
              return GestureDetector(
                onTap: () =>
                    setState(() => trackingMethod = option['title'] as String),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: isSelected ? Colors.amber : Colors.grey[300]!,
                      width: isSelected ? 3 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        option['icon'] as IconData,
                        color: Colors.grey[600],
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        option['title'] as String,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      if (isSelected)
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // NEW STEP 8: Health Goals
  Widget _buildHealthGoalsStep() {
    final healthGoals = [
      'Stay hydrated',
      'Improve fitness & performance',
      'Lose weight',
      'Boost energy & focus',
      'Cut back on unhealthy drinks',
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Health & Fitness Goals',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'What\'s your main health goal?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),

          Column(
            children: healthGoals.map((goal) {
              final isSelected = healthGoal == goal;
              return GestureDetector(
                onTap: () => setState(() => healthGoal = goal),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Colors.grey[300]!,
                      width: isSelected ? 3 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        goal,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      if (isSelected)
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // NEW STEP 9: Exercise Frequency
  Widget _buildExerciseStep() {
    final exerciseOptions = [
      {
        'title': 'Yes, daily',
        'icon': Icons.check_circle,
        'color': Colors.green
      },
      {
        'title': 'A few times a week',
        'icon': Icons.schedule,
        'color': Colors.orange
      },
      {'title': 'Not really', 'icon': Icons.cancel, 'color': Colors.red},
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Health & Fitness Goals',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Do you exercise regularly?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 60),

          Column(
            children: exerciseOptions.map((option) {
              final isSelected = exerciseFrequency == option['title'];
              return GestureDetector(
                onTap: () =>
                    setState(() =>
                    exerciseFrequency = option['title'] as String),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: isSelected ? (option['color'] as Color) : Colors
                          .grey[300]!,
                      width: isSelected ? 3 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        option['icon'] as IconData,
                        color: option['color'] as Color,
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        option['title'] as String,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      if (isSelected)
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: option['color'] as Color,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // NEW STEP 10: AI Reminders
  Widget _buildAIRemindersStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Personalization & AI Insights',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Would you like Ripple to remind you to drink based on your habits?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Yes option
              GestureDetector(
                onTap: () => setState(() => aiReminders = true),
                child: Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                    color: aiReminders ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: aiReminders ? Colors.yellow : Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '😊',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Yes',
                        style: TextStyle(
                          color: aiReminders ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // No option
              GestureDetector(
                onTap: () => setState(() => aiReminders = false),
                child: Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                    color: !aiReminders ? Colors.orange[200] : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '😞',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'No',
                        style: TextStyle(
                          color: !aiReminders ? Colors.black : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // NEW STEP 11: AI Recommendations
  Widget _buildAIRecommendationsStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            'Set Your Goals',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Personalization & AI Insights',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Would you like AI recommendations on improving your drink choices?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Yes option
              GestureDetector(
                onTap: () => setState(() => aiRecommendations = true),
                child: Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                    color: aiRecommendations ? Colors.yellow[200] : Colors
                        .white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '😊',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Yes',
                        style: TextStyle(
                          color: aiRecommendations ? Colors.black : Colors
                              .black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // No option
              GestureDetector(
                onTap: () => setState(() => aiRecommendations = false),
                child: Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                    color: !aiRecommendations ? AppColors.primary : Colors
                        .white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '😞',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'No',
                        style: TextStyle(
                          color: !aiRecommendations ? Colors.white : Colors
                              .black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAgePicker() {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Select Age'),
            content: SizedBox(
              height: 300,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 83, // Ages 18-100
                itemBuilder: (context, index) {
                  final ageOption = index + 18;
                  return ListTile(
                    title: Text('$ageOption years'),
                    selected: ageOption == age,
                    selectedTileColor: AppColors.primary.withOpacity(0.1),
                    onTap: () {
                      setState(() => age = ageOption);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
    );
  }

  void _showHeightPicker() {
    final heights = [
      '4FT', '4FT 2IN', '4FT 4IN', '4FT 6IN', '4FT 8IN', '4FT 10IN',
      '5FT', '5FT 2IN', '5FT 4IN', '5FT 6IN', '5FT 8IN', '5FT 10IN',
      '6FT', '6FT 2IN', '6FT 4IN', '6FT 6IN', '6FT 8IN', '6FT 10IN',
      '7FT'
    ];

    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Select Height'),
            content: SizedBox(
              height: 300,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: heights.length,
                itemBuilder: (context, index) {
                  final heightOption = heights[index];
                  return ListTile(
                    title: Text(heightOption),
                    selected: heightOption == height,
                    selectedTileColor: AppColors.primary.withOpacity(0.1),
                    onTap: () {
                      setState(() => height = heightOption);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
    );
  }

  void _showWeightPicker() {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Select Weight'),
            content: SizedBox(
              height: 300,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 151, // Weights 40-190 kg
                itemBuilder: (context, index) {
                  final weightOption = index + 40;
                  return ListTile(
                    title: Text('$weightOption kg'),
                    selected: weightOption == weight,
                    selectedTileColor: AppColors.primary.withOpacity(0.1),
                    onTap: () {
                      setState(() => weight = weightOption);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}