import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // to lock the screen orientation

import 'package:project3/widgets/expenses/expenses.dart';

ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 10, 0, 0));

ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 24, 0, 0),
);

void main() {

  // WidgetsFlutterBinding.ensureInitialized();
  // above line is added to ensure that locking the orientation and running the app
  // works as intended.
  
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  
   runApp(
      MaterialApp(
        // darkTheme: ThemeData.dark().copyWith(
        //   useMaterial3: true,
        //   colorScheme: kDarkColorScheme,
        //   cardTheme: const CardTheme().copyWith(
        //     color: kDarkColorScheme.secondaryContainer,
        //     margin: const EdgeInsets.symmetric(
        //       horizontal: 16,
        //       vertical: 8,
        //     ),
        //   ),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: kDarkColorScheme.primaryContainer,
        //     ),
        //   ),
        // ),

        // theme: ThemeData(useMaterial3: true), // by default it uses matterial 2
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                // used in expense card title
                fontWeight: FontWeight.bold,
                color: kColorScheme.onPrimaryContainer,
                fontSize: 17,
              )),
        ),
        // themeMode: ThemeMode.system, // default
        debugShowCheckedModeBanner: false,
        home: const Expenses(),
      ),
    );
  //);
}
