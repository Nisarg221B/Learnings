import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ex/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // the entire widget tree will rebuild if the user changes in any way
    // final user = ref.watch(userProvider);
    
    // the entire widget tree will only rebuild if the name changes.
    final userName = ref.watch(userProvider.select((value) => value.name));

    void onSubmit(WidgetRef ref, String value) {
      ref.read(userProvider.notifier).updateName(value);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          Center(
            child: Text(userName),
          ),
        ],
      ),
    );
  }
}
