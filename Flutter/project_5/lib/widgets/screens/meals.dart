import 'package:flutter/material.dart';
import 'package:project_5/models/meal.dart';
import 'package:project_5/widgets/meal_list_item.dart';
import 'package:project_5/widgets/screens/item_detail.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;
  @override
  State<StatefulWidget> createState() {
    return _MealsScreenState();
  }
}

class _MealsScreenState extends State<MealsScreen> {
  void _selectItem(BuildContext ctx, Meal M) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) {
        return ItemDetailScreen(aItem: M);
      }),
    ).then((anyvalue) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: widget.meals.length,
      itemBuilder: ((context, index) {
        return MealListItem(
          aMeal: widget.meals[index],
          openItemScreen: _selectItem,
        );
      }),
    );

    if (widget.meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh .. nothing here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Try Selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }
    if (widget.title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: content,
    );
  }

}
