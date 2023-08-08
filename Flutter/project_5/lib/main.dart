import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5/models/meal.dart';
import 'package:project_5/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(98, 58, 34, 49),
      brightness: Brightness.dark),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class Favorite extends InheritedWidget {
  final List<Meal> favoriteMeals = [];
  final Icon nonFav = const Icon(Icons.favorite_border);
  final Icon fav = const Icon(Icons.favorite);

  void toggleMealFavouriteStatus(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      favoriteMeals.remove(meal);
    } else {
      favoriteMeals.add(meal);
    }
    getFinalFavIcon(meal);
  }

  Icon getFinalFavIcon(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      return fav;
    } else {
      return nonFav;
    }
  }

  Favorite({super.key, required super.child});

  static Favorite? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Favorite>();
  }

  @override
  bool updateShouldNotify(covariant Favorite oldWidget) {
    return true;
    //return !listEquals(favoriteMeals, oldWidget.favoriteMeals);
  }
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) { 
    return Favorite(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const TabsScreen(),
      ),
    );
  }
}
