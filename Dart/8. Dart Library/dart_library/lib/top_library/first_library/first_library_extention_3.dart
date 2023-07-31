part of 'first_library.dart';

// import 'dart:math'; // Not allowed Fact#1
// import is not allowed as this file is part of first_library.dart , you can
// all the imports you want there and you can access it here

void first_library_extension_function() {
  var a = first_library_class();
  print("inside first library extention 3.dart");
  print("public field of class A : ${a.publicfield}");
  print("private field of class A : ${a._privatefield}");

  print("using a function from dart.math imported in first_library.dart ");
  var x = math.Random(2);
  var y = math.sin(90);
  print('$x $y' );
}
