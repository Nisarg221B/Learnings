import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_6/models/meal.dart';
import 'package:project_6/providers/favorite_provider.dart';

// ConsumerWidget is similar to statelesswidget
class ItemDetailScreen extends ConsumerWidget {
  final Meal aItem;
  const ItemDetailScreen({super.key, required this.aItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favoriteMealsProvider);
    // just to reload the UI if favourite Meals change
    // therefore when the heart icon is pressed the UI reloads

    return Scaffold(
      // appbar and favorite button
      appBar: AppBar(
        title: Text(aItem.title),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                // using comsumer here
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(aItem);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        wasAdded ? 'Meal added as Favorite' : 'Meal removed.'),
                  ),
                );
              },
              icon: AnimatedSwitcher( // implicit animations ( inbuild animations )
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: Tween(begin: 0.7, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: ref
                    .watch(favoriteMealsProvider.notifier)
                    .getFinalFavIcon(aItem),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            Hero(
              tag: aItem.id,
              child: Image.network(
                aItem.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Ingredients
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: aItem.ingredients
                      .map((e) => Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              '-   $e',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Steps
            Text(
              'Steps',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: aItem.steps.asMap().entries.map((entry) {
                int idx = entry.key;
                String val = entry.value;

                return Text(
                  '$idx.  $val \n',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  textAlign: TextAlign.left,
                  softWrap: true,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
