import 'dart:math';



void main() {
  print('#1 - sqrt(4) ->${sqrt(4)}');
  print('#2 - multiply(15,10) -> ${15 * 10}');
  print('#3 - sum(20,5) -> ${20 + 5}');
  Future.delayed(const Duration(seconds: 3),
      () => print('#4 - multiply(4,3) -> ${4 * 3}'));
  print('#5 - difference(20,5) -> ${20 - 5}');
}
