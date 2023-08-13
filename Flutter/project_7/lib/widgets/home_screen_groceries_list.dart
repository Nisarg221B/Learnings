import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_7/models/grocery_item.dart';

import 'package:project_7/providers/grocery_list_provider.dart';

class HomeScreenGroceriesList extends ConsumerStatefulWidget {
  const HomeScreenGroceriesList({super.key});

  @override
  ConsumerState<HomeScreenGroceriesList> createState() {
    return HomeScreenGroceriesListState();
  }
}

class HomeScreenGroceriesListState
    extends ConsumerState<HomeScreenGroceriesList> {
  String? _error;

  @override
  void initState() {
    super.initState();
    ref.read(groceryListProvider.notifier).loadItems().then((value) {
      if (value.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });
      }
      ref.watch(isloadingProvider.notifier).setFalse();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(
        child: Text(_error!),
      );
    }
    List<GroceryItem> groceryList = ref.watch(groceryListProvider);
    ref.watch(isloadingProvider);

    if (ref.watch(isloadingProvider)) {
      return const Center(
        child: RefreshProgressIndicator(),
      );
    }

    if (groceryList.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uhh.. Nothing to show here\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 24,
                  ),
            ),
            Text(
              "please add Items to show here",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      );
    }

    return ListView(
      children: ref
          .watch(groceryListProvider)
          .map(
            (item) => Dismissible(
              onDismissed: (direction) {
                ref.read(groceryListProvider.notifier).removeItem(item);
              },
              key: ValueKey(item.id),
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // colored box
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(color: item.category.color),
                    ),
                    const SizedBox(
                      width: 30,
                    ),

                    // item name
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const Spacer(),

                    // item quantity
                    Text(
                      '${item.quantity}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
