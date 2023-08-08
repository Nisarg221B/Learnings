import 'package:flutter/material.dart';
import 'package:project_5/main.dart';
import 'package:project_5/models/meal.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.aItem});

  final Meal aItem;

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailScreenState();
  }
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  late final Meal aItem;

  @override
  void initState() {
    super.initState();
    aItem = widget.aItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar and favorite button
      appBar: AppBar(
        title: Text(aItem.title),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  Favorite.of(context)!.toggleMealFavouriteStatus(aItem);
                });
              },
              icon: Favorite.of(context)!.getFinalFavIcon(aItem),
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
            Image.network(
              aItem.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
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
