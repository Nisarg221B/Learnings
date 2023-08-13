import 'package:flutter/material.dart';

import 'package:project_6/widgets/category_grid_item.dart';
import 'package:project_6/data/dummy_data.dart';
import 'package:project_6/screens/meals.dart';
import 'package:project_6/models/category.dart';
import 'package:project_6/models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.filterUpdatedAllMeals});

  final List<Meal> filterUpdatedAllMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Method to push the meals screen on top of categories screen
  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeals = widget.filterUpdatedAllMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigator.of(context).push(route);
    Navigator.push(
      context,
      //route
      MaterialPageRoute(
        builder: ((context) {
          return MealsScreen(
            title: category.title,
            meals: filteredMeals,
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      // The child is not called multiple type
      child: GridView(
        padding: const EdgeInsets.all(16),
        // main axis - top to bottom
        // cross axis - left to right
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // setting number of columns
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        // children: availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
        // or
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              () {
                _selectCategory(context, category);
              },
              category: category,
            )
        ],
      ),

      // The builder is rebuild and re-evaluated 60 times per minute
      // (only the Padding widget in builder, the child is same as above child
      // which will not get rebuild)
      // builder: (context, child) => Padding(
      //   padding: EdgeInsets.only(
      //     top: 50 - _animationController.value * 50,
      //   ),
      //   child: child,
      // ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.2),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }
}
