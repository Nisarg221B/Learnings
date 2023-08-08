import 'package:flutter/material.dart';
import 'package:project_5/main.dart';
import 'package:project_5/widgets/main_drawer.dart';
import 'package:project_5/widgets/screens/categories.dart';
import 'package:project_5/widgets/screens/filters.dart';
import 'package:project_5/widgets/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreenDrawer(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      Navigator.pushReplacement( // also see pushreplacement
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
    Widget activePage = const CategoriesScreen();
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
