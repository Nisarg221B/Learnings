import 'package:flutter/material.dart';
import 'package:project_6/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealListItem extends StatelessWidget {
  const MealListItem(
      {super.key, required this.aMeal, required this.openItemScreen});
  final Meal aMeal;
  final Function(BuildContext context, Meal M) openItemScreen;

  Widget mealItemTrait({required IconData icon, required String label}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: InkWell(
        onTap: () {
          openItemScreen(context,aMeal);
        },
        child: Stack(
          children: [
            Hero( // to animate across different screen
              tag: aMeal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(aMeal.imageUrl),
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
                child: Column(
                  children: [
                    Text(
                      aMeal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow
                          .ellipsis, // cut of by adding ...  if overflowed
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mealItemTrait(
                            icon: Icons.schedule,
                            label: '${aMeal.duration} min'),
                        mealItemTrait(
                            icon: Icons.work,
                            label: aMeal.complexity.name[0].toUpperCase() +
                                aMeal.complexity.name.substring(1)),
                        mealItemTrait(
                            icon: Icons.attach_money,
                            label: aMeal.affordability.name[0].toUpperCase() +
                                aMeal.affordability.name.substring(1)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
