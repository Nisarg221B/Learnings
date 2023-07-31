library first_library; // not necessary though recommended

import 'dart:math' as math;

part 'first_library_extention_1.dart';
part 'first_library_extention_2.dart';
part 'first_library_extention_3.dart';


/*
Fact #1 - Only "part of" directives are allowed inside "extension" files from inside a library
(see first_library_extention_3)

Fact #2 - All "extension" files can access both private and public members of the library
*/

class first_library_class {
  final int _privatefield = 5;
  void _privateMethod() {}

  final int publicfield = 10;
  void publicmMethod() {}
}
