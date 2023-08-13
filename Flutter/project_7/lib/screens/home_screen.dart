import 'package:flutter/material.dart';
import 'package:project_7/screens/new_item_screen.dart';
import 'package:project_7/widgets/home_screen_groceries_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Your Groceries',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 24,
              ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return const NewItem();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: const HomeScreenGroceriesList(),
    );
  }
}
