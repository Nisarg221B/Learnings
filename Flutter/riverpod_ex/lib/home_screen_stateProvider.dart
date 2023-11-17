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
    final name = ref.watch(nameProvider) ?? '';

    void onSubmit(WidgetRef ref, String value) {
      // updating the StateProvider value by accessing the StateController using notifier method
      // then updating its state to the new value
      //ref.read(nameProvider.notifier).state = value;
      ref.read(nameProvider.notifier).update((state) => value);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          Center(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
