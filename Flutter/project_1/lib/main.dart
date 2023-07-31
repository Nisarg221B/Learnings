import 'package:flutter/material.dart';
import 'package:project_1/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 80, 80, 80),
        body: GradientContainer(gradColorslist: [
             Color.fromARGB(19, 255, 68, 68),
             Color.fromARGB(40, 103, 0, 172)
        ]),
      ),
    ),
  );
}
