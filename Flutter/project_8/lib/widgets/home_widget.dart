import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_8/screens/place_detail_screen.dart';
import 'package:project_8/providers/places_list_provider.dart';

class HomeScreenContent extends ConsumerWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content;
    ref.watch(placesListProvider);

    final placeList = ref.watch(placesListProvider);

    
    if (placeList.isEmpty) {
      content = Center(
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
    } else {
      content = ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: placeList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              ref.watch(placesListProvider.notifier).removePlace(placeList[index]);
            },
            key: ValueKey(ref.watch(placesListProvider)[index].id),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: FileImage(placeList[index].image),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return PlaceDetailScreen(
                        place: placeList[index],
                      );
                    }),
                  );
                },
                // contentPadding: EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  placeList[index].name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  placeList[index].location.address,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
    return content;
  }
}
