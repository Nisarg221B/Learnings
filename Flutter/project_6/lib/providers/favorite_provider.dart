import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_6/models/meal.dart';
import 'package:flutter/material.dart';

/*
use StateNotifierProvider class insted of Provider class 
as the StateNotifierProvider class is another provider class provided by 
riverpod package for handling the data which changes.

this StateNotifierProvider class works with another class StateNotifier. here
we build our own class which extends this class.
*/

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    // state // this state property hold ;your data.
    // in the riverpod package we cannot edit the data , we have to reassign them
    // imples state.add or state.remove not available
    // only assignment available
    if (mealIsFavorite) {
      state = state.where((meale) => meale.id != meal.id).toList();
      // excluding the meal
      return false;
    } else {
      state = [...state, meal]; // adding a new meal
      return true;
    }
  }

  Icon getFinalFavIcon(Meal meal) {
    final isExisting = state.contains(meal);
    if (!isExisting) {
      return Icon(Icons.favorite_border,key: ValueKey(isExisting),);
    }
    return Icon(Icons.favorite,key: ValueKey(isExisting),);
  }
}

final favoriteMealsProvider =
// we neeed to specify which type of data will the favoriteMealsNotifier provides - List<Meal>
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

