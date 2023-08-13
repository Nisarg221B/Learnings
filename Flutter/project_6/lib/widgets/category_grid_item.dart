import 'package:flutter/material.dart';
import 'package:project_6/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(this.onSelectCategory,{super.key, required this.category});

  final void Function() onSelectCategory;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(13), // taping feedback radius
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(13), // box radius
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
