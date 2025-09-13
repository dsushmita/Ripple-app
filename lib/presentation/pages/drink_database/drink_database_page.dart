import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'edit_drink_page.dart';

class DrinkDatabasePage extends StatefulWidget {
  const DrinkDatabasePage({Key? key}) : super(key: key);

  @override
  State<DrinkDatabasePage> createState() => _DrinkDatabasePageState();
}

class _DrinkDatabasePageState extends State<DrinkDatabasePage> {
  final TextEditingController _searchController = TextEditingController();
  List<DrinkItem> _filteredDrinks = [];

  final List<DrinkItem> _preloadedDrinks = [
    DrinkItem(
      name: 'Water',
      volume: '250ml',
      alcoholPercentage: '0%',
      calories: '0 Calories',
      sugar: '0g Sugar',
      icon: Icons.water_drop,
      color: Colors.blue,
      iconBackground: Colors.blue.shade50,
    ),
    DrinkItem(
      name: 'Orange Juice',
      volume: '250ml',
      alcoholPercentage: '0%',
      calories: '110 Calories',
      sugar: '23g Sugar',
      icon: Icons.local_drink,
      color: Colors.orange,
      iconBackground: Colors.orange.shade50,
    ),
    DrinkItem(
      name: 'Soda',
      volume: '330ml',
      alcoholPercentage: '0%',
      calories: '150 Calories',
      sugar: '39g Sugar',
      icon: Icons.local_drink,
      color: Colors.red.shade700,
      iconBackground: Colors.red.shade50,
    ),
    DrinkItem(
      name: 'Milk',
      volume: '250ml',
      alcoholPercentage: '0%',
      calories: '110 Calories',
      sugar: '23g Sugar',
      icon: Icons.local_drink,
      color: Colors.blue.shade300,
      iconBackground: Colors.blue.shade50,
    ),
    DrinkItem(
      name: 'Alcoholic Drinks',
      volume: '350ml',
      alcoholPercentage: '5%',
      calories: '150 Calories',
      sugar: '39g Sugar',
      icon: Icons.local_bar,
      color: Colors.amber.shade700,
      iconBackground: Colors.amber.shade50,
    ),
    DrinkItem(
      name: 'Coffee',
      volume: '250ml',
      alcoholPercentage: '0%',
      calories: '2 Calories',
      sugar: '0g Sugar',
      icon: Icons.coffee,
      color: Colors.brown,
      iconBackground: Colors.brown.shade50,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredDrinks = List.from(_preloadedDrinks);
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
          'Drink Database',
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
          // Search Bar
          _buildSearchBar(),
          
          // Preloaded Drinks Section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Preloaded Drinks',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '${_filteredDrinks.length} drinks',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Drinks List
                  if (_filteredDrinks.isEmpty)
                    _buildEmptyState()
                  else
                    ..._filteredDrinks.map((drink) => _buildDrinkItem(drink)).toList(),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          
          // Add New Drink Button
          _buildAddNewDrinkButton(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(20),
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
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        onChanged: _filterDrinks,
      ),
    );
  }

  Widget _buildDrinkItem(DrinkItem drink) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: drink.iconBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            drink.icon,
            color: drink.color,
            size: 24,
          ),
        ),
        title: Text(
          drink.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${drink.calories}, ${drink.sugar}',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            if (drink.alcoholPercentage != '0%')
              Text(
                'Alcohol: ${drink.alcoholPercentage}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              drink.volume,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: AppColors.textSecondary),
              onPressed: () => _editDrink(drink),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Icon(
            Icons.search_off,
            size: 64,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No drinks found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewDrinkButton() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(28),
      ),
      child: ElevatedButton(
        onPressed: _addNewDrink,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add New Drink',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.add, color: Colors.white),
          ],
        ),
      ),
    );
  }

  void _filterDrinks(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDrinks = List.from(_preloadedDrinks);
      } else {
        _filteredDrinks = _preloadedDrinks
            .where((drink) => drink.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _editDrink(DrinkItem drink) async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => EditDrinkPage(
          drinkName: drink.name,
          drinkVolume: drink.volume,
          alcoholPercentage: drink.alcoholPercentage,
          calories: drink.calories,
          sugar: drink.sugar,
        ),
      ),
    );

    if (result != null) {
      _updateDrinkFromResult(drink, result);
    }
  }

  void _addNewDrink() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => const EditDrinkPage(),
      ),
    );

    if (result != null) {
      _addDrinkFromResult(result);
    }
  }

  void _updateDrinkFromResult(DrinkItem drink, Map<String, String> result) {
    setState(() {
      final index = _preloadedDrinks.indexOf(drink);
      if (index != -1) {
        _preloadedDrinks[index] = DrinkItem(
          name: result['name']!,
          volume: result['volume']!,
          alcoholPercentage: result['alcoholPercentage']!,
          calories: result['calories']!,
          sugar: result['sugar']!,
          icon: drink.icon,
          color: drink.color,
          iconBackground: drink.iconBackground,
        );
        _filterDrinks(_searchController.text); // Refresh filtered list
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Drink updated successfully!'),
        backgroundColor: AppColors.primary,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _addDrinkFromResult(Map<String, String> result) {
    setState(() {
      final newDrink = DrinkItem(
        name: result['name']!,
        volume: result['volume']!,
        alcoholPercentage: result['alcoholPercentage']!,
        calories: result['calories']!,
        sugar: result['sugar']!,
        icon: Icons.local_drink,
        color: AppColors.primary,
        iconBackground: AppColors.primary.withOpacity(0.1),
      );
      
      _preloadedDrinks.add(newDrink);
      _filterDrinks(_searchController.text); // Refresh filtered list
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New drink added successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class DrinkItem {
  final String name;
  final String volume;
  final String alcoholPercentage;
  final String calories;
  final String sugar;
  final IconData icon;
  final Color color;
  final Color iconBackground;

  DrinkItem({
    required this.name,
    required this.volume,
    required this.alcoholPercentage,
    required this.calories,
    required this.sugar,
    required this.icon,
    required this.color,
    required this.iconBackground,
  });
}