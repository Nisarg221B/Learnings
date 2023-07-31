/*



 return                 1 value            0 or more value
Synchronous        |      T           |    Iterable<T>         |
Asynchronous       |    Future<T>     |    Stream<T>           |

*/
void main() {
  print('A');
  Future(() {
    print('B');
    Future(() => print('C'));
    Future(() => print('D'));
    Future(() => print('E'));
    print('F');
  });
  print('G');
}
