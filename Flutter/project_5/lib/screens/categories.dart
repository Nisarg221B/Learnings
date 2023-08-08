import 'package:flutter/material.dart';
import 'package:project_5/widgets/category_grid_item.dart';
import 'package:project_5/data/dummy_data.dart';
import 'package:project_5/screens/meals.dart';
import 'package:project_5/models/category.dart';
import 'package:project_5/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.filterUpdatedAllMeals});

  final List<Meal> filterUpdatedAllMeals;

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeals = filterUpdatedAllMeals
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
    return GridView(
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
    );
  }
}
