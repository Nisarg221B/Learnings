import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;

  final void Function() onPress;

  const AnswerButton({
    required this.text,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 62, 37, 161),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.centerLeft
          ),
          child: Text(
            text,
          ),
        ),
        const SizedBox(height:10),
      ],
    );
  }
}
