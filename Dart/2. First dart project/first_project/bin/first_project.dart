import 'package:first_project/first_project.dart';

/*
to run 
->  dart run (it search for bin/project_name.dart by default and run it)
-> dart run <path for the main file>
*/
/*
 creating a package
 adding the dependency to pubspec.yaml
 dart pub get
 dart pub add commands
*/

void main(List<String> arguments) {
  print("Tow numbers are 3 and 23");
  print('Add: ${calculateAdd().toString()}');
  print('Subtract: ${calculateSubtract().toString()}');
  print('Multiply: ${calculateMultiply().toString()}');
  print('Divide: ${calculateDivide().toString()}');
}
