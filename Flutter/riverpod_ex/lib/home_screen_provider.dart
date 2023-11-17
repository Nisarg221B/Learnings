import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ex/main.dart';
/*
INDEX
1. Using ConsumerWidget   
2. Using Consumer builder widget
3. Using ConsumerStatefullWidget

*/

//************* 1. Using ConsumerWidget stateless ******************//

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider) ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}

//************* 2. Using Consumer ******************//

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
          // only this part is under watch and will get rebuild on change
          builder: (context, ref, child) {
        final name = ref.watch(nameProvider) ?? '';
        return Column(
          children: [
            Center(
              child: Text(name),
            ),
          ],
        );
      }),
    );
  }
}


// ************* 2. Using Consumer widget in stateful widget ******************//

class MyHomePage3 extends ConsumerStatefulWidget {
  const MyHomePage3({super.key});

  @override
  ConsumerState<MyHomePage3> createState() => _MyHomePageState3();
}

class _MyHomePageState3 extends ConsumerState<MyHomePage3> {

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider) ?? '';
  
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
