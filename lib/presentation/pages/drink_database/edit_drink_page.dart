import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class EditDrinkPage extends StatefulWidget {
  final String? drinkName;
  final String? drinkVolume;
  final String? alcoholPercentage;
  final String? calories;
  final String? sugar;

  const EditDrinkPage({
    Key? key,
    this.drinkName,
    this.drinkVolume,
    this.alcoholPercentage,
    this.calories,
    this.sugar,
  }) : super(key: key);

  @override
  State<EditDrinkPage> createState() => _EditDrinkPageState();
}

class _EditDrinkPageState extends State<EditDrinkPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _alcoholController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _sugarController = TextEditingController();
  
  String _selectedVolume = '250ml';
  
  final List<String> _volumeOptions = [
    '100ml', '150ml', '200ml', '250ml', '300ml', '350ml', '400ml', '450ml', '500ml',
    '550ml', '600ml', '700ml', '750ml', '800ml', '1000ml'
  ];

  @override
  void initState() {
    super.initState();
    // Initialize with passed data
    _nameController.text = widget.drinkName ?? 'Water';
    _selectedVolume = widget.drinkVolume ?? '250ml';
    _alcoholController.text = widget.alcoholPercentage ?? '0%';
    _caloriesController.text = widget.calories ?? '0 Calories';
    _sugarController.text = widget.sugar ?? '0 Sugar';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Drink',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  
                  // Enter Name
                  _buildInputField(
                    label: 'Enter Name',
                    controller: _nameController,
                  ),
                  const SizedBox(height: 24),
                  
                  // Volume
                  _buildDropdownField(
                    label: 'Volume',
                    value: _selectedVolume,
                    items: _volumeOptions,
                    onChanged: (value) => setState(() => _selectedVolume = value!),
                  ),
                  const SizedBox(height: 24),
                  
                  // Alcohol Percentage
                  _buildInputField(
                    label: 'Alcohol Percentage',
                    controller: _alcoholController,
                    suffix: '%',
                  ),
                  const SizedBox(height: 24),
                  
                  // Calories
                  _buildInputField(
                    label: 'Calories',
                    controller: _caloriesController,
                    suffix: 'Calories',
                  ),
                  const SizedBox(height: 24),
                  
                  // Sugar
                  _buildInputField(
                    label: 'Sugar',
                    controller: _sugarController,
                    suffix: 'Sugar',
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          
          // Save Button
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    String? suffix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              suffixText: suffix,
              suffixStyle: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(28),
      ),
      child: ElevatedButton(
        onPressed: _saveDrink,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Text(
          'Save Now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _saveDrink() {
    // Validate inputs
    if (_nameController.text.isEmpty) {
      _showErrorSnackBar('Please enter a drink name');
      return;
    }

    // Create drink data
    final drinkData = {
      'name': _nameController.text,
      'volume': _selectedVolume,
      'alcoholPercentage': _alcoholController.text,
      'calories': _caloriesController.text,
      'sugar': _sugarController.text,
    };

    // Return the data to previous page
    Navigator.pop(context, drinkData);
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Drink saved successfully!'),
        backgroundColor: AppColors.primary,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _alcoholController.dispose();
    _caloriesController.dispose();
    _sugarController.dispose();
    super.dispose();
  }
}