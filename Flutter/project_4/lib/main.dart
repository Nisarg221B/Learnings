import 'package:flutter/material.dart';
import 'package:project4/pagers/page_1.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First Page'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            final number = index + 1;
            return FirstPage(number: number);
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 5,
        ),
      ),
    ),
  );
}
