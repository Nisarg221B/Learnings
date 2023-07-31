/*
documentation : https://dart.dev/language/built-in-types

local :
obsidian://open?vault=Documents&file=Technical%20Learning%20Notes%2FDart%2F4.%20Variables%2FDart%20variables

CONTENT:
  1. NUMBER (num,int,double) , String 
  2. List
  3. Map - Set
*/

void num_demo() {
  print(
      '\n////////////////////////////////////// num demo ////////////////////////////////////////////\n');
  int a = 5;
  num c = 3;
  double d = 6;
  print(
      '${c - d}'); // operations supported by both int and double are also suppoerted by num

  String s = '5';
  a = int.parse(s);
  d = double.parse(s);
  c = num.parse(s);
  print("a = $a ,d = $d ,c = $c");

  String s1 = a.toString();
  String s2 = d.toString();
  String s3 = c.toString();

  print("s1= $s1 ,s2= $s2 ,s3= $s3");

  int dc = d.ceil();
  int df = d.floor();
  int dr = d.round();

  print("dc= $dc ,df= $df ,dr= $dr");

  // the default division operator returns double value
  double dx = a / c; // 3/0 -> inf
  print(dx);
  print(3 / 0);
  int ix = a ~/ c; // to return int , 3/0 -> error
  print(ix);
}

void list_demo() {
  print(
      '\n////////////////////////////////////// list demo ////////////////////////////////////////////\n');
  // ordered group of objects
  List<int> l = [4, 5, 3];
  var l2 = [4, 5, 3]; // same as above
  // List<A> la = [A(),A()]; // for class A(){}
  List<Object> lo = [3.0, 3, 'hello'];
  List<Object?> lon = [3.0, 3, 'hello', null];
  List<dynamic> lod = [3.0, 3, 'hello', null];

  var first_lod = lod[0] as double; // this is our responsibility

  List<int> a = [3, 5, 6]; // list and content both are not-nullable
  List<int?> b = [3, null, 6]; // List in not nullable , content can be nullable
  List<int>? c = [4, 6, 10]; // list is nullable , content cannot be null
  List<int?>? d = null; // list and content both are nullable

  // Different ways to instantiate a list
  List<int> xa = [];
  List<int> xb = [1, 3, 5];
  List<int> xc = List.filled(3, 4);
  List<int>? xf = null;
  List<int> xd = [
    ...xb,
    ...xc,
    ...?xf
  ]; // ... the fill operator , ... with null aware operator ...? fill with null thus it won't appear in the output.
  List<int> xe = List.empty(
      growable:
          true); // some of the constructors have growable parameter to be taken care of

  print('xa $xa');
  print('xb $xb');
  print('xc $xc');
  print('xd $xd');
  print('xe $xe');

  // unlike numbers , list and string literals are not constant by default
  List<int> list1 = const [3, 6, 7];
  List<int> list2 = const [3, 6, 7];
  List<int> list3 = [3, 6, 7];
  print('list1 : ${list1.hashCode}');
  print('list2 : ${list2.hashCode}');
  print('list3 : ${list3.hashCode}');
}

void set_map_demo() {
  print(
      '\n////////////////////////////////////// Set map demo ////////////////////////////////////////////\n');
  Set<int> s = {};
  s.add(4);
  s.addAll({2, 3, 4});

  Set<int> s1 = Set(); // same as above
  Set<int> s2 = {3, 2, 1, 4, 4, 3};
  var s4 = {3, 2, 1, 4, 4, 3}; // set
  var s5 = <int>{}; // set
  var s3 = {}; // map not set ( the curlly braces are set default to map type)

  var intersect = s.intersection(s2);
  var union = s.union(s2);
  var difference = s.difference(s2);
  print('s : $s');
  print('s4 : $s4');
  print('s3 : $s3');
  print("between $s && $s2");
  print('intersect = $intersect');
  print('union = $union');
  print('difference = $difference');
  // Maps
  var m = {3: 4};

  var m3 = {
    'a': 1,
    'b': 2,
    'c': 3,
  };

  var m4 = Map<String, int>();

  var m2 = {}; // map of type <dynamic, dynamic>
  var m5 = Map(); // map of type <dynamic,dynamic>
  m5[3] = 4;
  m5[4] = 5;
  m5['a'] = 6;

  var m6 = {1: 1, 2: 2, 3: 3}; //  map of type <int,int>
  print("\nMapppp\n\nm5 : $m5, ${m5.runtimeType}");
  // map<key,value> m , key and value can be any objects
  // The map index operator [] is nullable
  print(m6[6]?.isOdd); // prints null
  print(m6[2]?.isOdd); // prints false

  m6.addEntries([MapEntry(6, 6)]);
  print("m6 : $m6 , ${m6.runtimeType}");
}

void main() {
  num_demo();
  list_demo();
  set_map_demo();
}
