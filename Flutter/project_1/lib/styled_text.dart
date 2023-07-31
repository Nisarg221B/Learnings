library styled_text;

import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  const StyledText(this.text, {super.key});

  @override
  Widget build(context) {
    String x = text;
    return Text(
      x,
      style: const TextStyle(
        fontSize: 48,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
