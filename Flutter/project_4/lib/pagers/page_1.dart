import 'package:flutter/material.dart';
import 'package:project4/widget/number_widget.dart';

class FirstPage extends StatefulWidget {
  final int number;
  const FirstPage({super.key, required this.number});

  @override
  State<FirstPage> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    int number = widget.number;
    return Row(
      children: [
        NumberWidget(number: widget.number),
        IconButton(
          onPressed: () {
            setState(() {
               number += 1;
            });
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
