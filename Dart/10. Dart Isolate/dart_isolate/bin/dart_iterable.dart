List<int> showNormal(int n) {
  final x = <int>[];

  print('Normal started ..');
  for (var i = 0; i < n; i++) {
    print('i ->$i');
    x.add(i);
  }
  print('Normal ended ..');
  return x;
}


// Iterables are lazy generated ( synchronously )
// Iterables generate just the right amount of items they need
Iterable<int> showGenerator(int n) sync* {
  print('Generator started ..');
  for (var i = 0; i < n; i++) {
    print('i ->$i');
    yield i;
  }
  print('Generator ended ..');
}

void main(){
  print('\nDefining both lists\n');
  final list1 = showNormal(10);
  final list2 = showGenerator(10);
  print('\nDefined both lists\n');
  print('\nAccessing last elements both lists\n');
  print('list1 last element -> ${list1.last}');
  print('list2 last element -> ${list2.last}');

  print('\nAccessing first elements both lists\n'); 
  print('list1 frist element -> ${list1.first}');
  print('list2 frist element -> ${list2.first}');
}