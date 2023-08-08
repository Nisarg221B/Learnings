import 'package:flutter/material.dart';
import 'package:project_5/data/dummy_data.dart';
import 'package:project_5/main.dart';
import 'package:project_5/widgets/main_drawer.dart';
import 'package:project_5/screens/categories.dart';
import 'package:project_5/screens/filters.dart';
import 'package:project_5/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

const Map<Filter, bool> defaultFilters = {
  Filter.glutenfree: false,
  Filter.lactosfree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  Map<Filter, bool> _selectedFilters = defaultFilters;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreenDrawer(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      Map<Filter, bool>? result = await Navigator.push<Map<Filter, bool>>(
        // also see pushreplacement
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return FiltersScreen(currentFilters: _selectedFilters);
          },
        ),
      );
      setState(() {
        _selectedFilters = result ?? defaultFilters;
        // ?? - to use fallback
        // implies if the result is null use defaultFilters else use result
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactosfree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(filterUpdatedAllMeals: availableMeals);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: Favorite.of(context)!.favoriteMeals);
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
