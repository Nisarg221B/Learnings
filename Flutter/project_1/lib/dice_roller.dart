import 'package:flutter/material.dart';
import 'package:project_1/styled_text.dart';
import 'dart:math';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() {
    return _RollDice();
  }
}

class _RollDice extends State<RollDice> {
  var activeDiceNumber = 1;
  String activeDiceImage = "/images/dice-1.png";

  void rollDice() {
    int x = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImage = "/images/dice-$x.png";
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const StyledText("Dice Rolling Game\n"),
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        // const Spacer(),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
            textStyle: const TextStyle(
              fontSize: 14,
            ),
            backgroundColor: Color.fromARGB(19, 255, 169, 169),
            elevation: 2,
          ),
          child: const Text('Roll the dice'),
        ),
      ],
    );
  }
}
