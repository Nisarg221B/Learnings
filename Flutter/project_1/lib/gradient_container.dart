import 'package:flutter/material.dart';
import 'package:project_1/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> gradColorslist;
  const GradientContainer({key, required this.gradColorslist}) : super(key: key);

  @override
  Widget build(context) {
    Widget toReturn = Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradColorslist,
            begin: startAlignment,
            end: endAlignment,
          ),
        ),
        child: const Center(
          child: RollDice(),
        ),
    
    );
    return toReturn;
  }
}
