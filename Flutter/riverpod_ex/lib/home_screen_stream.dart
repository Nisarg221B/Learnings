import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ex/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(fetchUserProvider);

    // return user.when(
    //   data: (data) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: Text(data.name),
    //       ),
    //       body: Column(
    //         children: [
    //           Center(
    //             child: Text(data.name),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    //   error: (err, stackTrace) {
    //     return Center(
    //       child: Text(err.toString()),
    //     );
    //   },
    //   loading: () {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
    return ref.watch(streamProvider).when(
      data: (data) {
        return Text(data.toString());
      },
      error: (error, stacktree) {
        return Scaffold(
          body: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
