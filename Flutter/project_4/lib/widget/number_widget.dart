import 'package:flutter/material.dart';

class NumberWidget extends StatefulWidget {
  int number;

  NumberWidget({super.key, required this.number});

  // first method which is called in statefulwidget lifecycle
  // and then our lifecycle begins
  @override
  State<NumberWidget> createState() {
    print('Number: $number CreateState');
    return _NumberWidgetState();
  }
}

class _NumberWidgetState extends State<NumberWidget> {
  late int number;

  // in the begining of our lifecycle initstate method is called
  // this method is called everytime when the state is created
  // here we can initialize our widget
  @override
  void initState() {
    super.initState();

    print('Number: ${widget.number} InitState');
    number = widget.number;
  }

  // then comes our build method which creates our UI
  @override
  Widget build(BuildContext context) {
    print('Number: ${widget.number} Build');
    return Center(
      child: Container(
        height: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                number.toString(),
                style: const TextStyle(fontSize: 60),
              ),
              onPressed: () {
                setState(() {
                  print('Number: ${widget.number} SetState');
                  number += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // this method is called when this whole widget is changed 
  // implies the constructor of NumberWidget class changes
  // (called when widget configuration changes)
  @override
  void didUpdateWidget(covariant NumberWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Number: $number DidUpdateWidget');
    if (oldWidget.number != widget.number) {
      print('changed Number');
    }
  }

  // and at the end of our life cycle dispose method is called
  @override
  void dispose() {
    print('Number: $number Dispose');

    super.dispose();
  }
}
