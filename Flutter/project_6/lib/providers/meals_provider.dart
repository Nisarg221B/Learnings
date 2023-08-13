import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_6/data/dummy_data.dart';
import 'package:project_6/models/meal.dart';

Provider<List<Meal>> mealsProvider = Provider((ref) => dummyMeals);

