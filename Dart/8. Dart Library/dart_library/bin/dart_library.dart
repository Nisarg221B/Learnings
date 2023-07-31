/*
 all .dart files are libraries
 1. can one library be formed out of multiple files ?
        - using part and parts of directives
 2. can one library contain multiple libraries ?
        - Using keyword export

for details see the files under lib folder
*/

import 'package:dart_library/top_library/top_library.dart';

// using package: path is prefereable and advisable instead of relative paths
// this import will get the all first, second and third library  and subsequent parts of them

/*
Scenario #1 - Import the "big" library , that will subsequently import the rest of 
libraries, including the one containing you implementation ( if you need all 
implementations from all libraries)

Scenario #2 - Import only the library that you need , containing your implemetation
*/

void main() {
  var a = first_library_class();
  print(a.publicfield);
  // private fields and methods of class A not available here
  // because the private fields are library private in dart
  // imples they can only be access in the library they are defined.

  // Therefore every feature or functionality should be place in seperate library
  // 1 Feature = 1 Library
  var b = second_library_class();
  print(b.publicField);

  var x = third_library_class();
  third_library_extension_method();

}
