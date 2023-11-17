import 'package:flutter/material.dart';
import 'package:riverpod_ex/home_screen_stream.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ex/user.dart';
// import 'package:http/http.dart' as http;

// String name = ' '; // not a good idea, as it is mutable and easily accessable thus prone to errors and hard to debug
// thus we use providers

// 1. Provider
// change import to home_screen_provider
// final nameProvider = Provider<String?>((ref) => 'Nisarg');

// 2. StateProvider
// change import to home_screen_stateProvider
final nameProvider = StateProvider<String?>((ref) => 'Nisarg');

// 3. StateNotifier and StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(
      email: '',
      name: '',
    ),
  ),
);

// 4. FutureProvider
final fetchUserProvider = FutureProvider((ref) {
  //a.
  //const url = "https://jsonplaceholder.typicode.com/users/1";
  // return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));

  // b.
  // return UserRepository().fetchUserData();

  // c.
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

// 5. streamProvider

final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        title: 'flutter riverpod learning',
        home: MyHomePage(),
      ),
    );
  }
}
