import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_6/providers/filters_provider.dart';

import 'package:project_6/widgets/main_drawer.dart';
import 'package:project_6/screens/categories.dart';
import 'package:project_6/screens/filters.dart';
import 'package:project_6/screens/meals.dart';
import 'package:project_6/providers/favorite_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

const Map<Filter, bool> defaultFilters = {
  Filter.glutenfree: false,
  Filter.lactosfree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreenDrawer(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      await Navigator.push<Map<Filter, bool>>(
        // also see pushreplacement
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const FiltersScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ref.read(Provider);  // read data once
    // ref.watch(Provider); // to read data and execute the build method when the data changes
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(filterUpdatedAllMeals: availableMeals);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      /*
      The riverpod package automaticcally extracts the 'state' property value from
      the notifier class that belongs to the provider. Hence, ref.watch() yields
      List<Meal> here (insted of the notifier class).
      */
      activePage = MealsScreen(meals: favoriteMeals);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreenDrawer),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: const Color.fromARGB(255, 190, 68, 59),
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
        ],
      ),
    );
  }
}
