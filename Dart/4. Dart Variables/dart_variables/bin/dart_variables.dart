/*
documentation : https://dart.dev/language/variables

local :
obsidian://open?vault=Documents&file=Technical%20Learning%20Notes%2FDart%2F4.%20Variables%2FDart%20variables

*/

/*
a. Top level variables
b. static variables
c. instant variables
d. local variables

CONTENT 

- var vs dynamic 
- const vs final

*/

int t = 3;

int? nullableToplevel;

late int nonNullableTopLevel;

class A {
  //! static variable
  static int s = 12;
  static int? nullablestatic;
  static late int nullablestatic2;
  //! instant variable (field/property)
  double i = 25;
  double nonNullableInstance;

  A({required this.i}) : nonNullableInstance = 3 {
    //? contructor body
  }
}

void somefunc() {
  int x = 32; // local variable
  print(x);

  int? nullableLocal;
  int nonnullableLocal;
  nullableLocal = 5;
  nonnullableLocal = 13;
  print(nullableLocal.isEven);
  print(nonnullableLocal.isEven);
}

void var_dynamic_demo() {
  print(
      "\n/////////////////////////var - dynamic ///////////////////////////////////");
  var vi = 5; // var is infered to int => int vi = 5;
  var vs = "example";
  var vl = [3, 2, 4];

  print('\nvar runtimeTypes:\n');
  print(vi.runtimeType);
  print(vs.runtimeType);
  print(vl.runtimeType);
  // once var is infered to its type at complie time , its not allowed to change the type
  // vi = 3.0; ( not allowed to change int to double )

  dynamic di = 5; // dynamic is a type in itself and is infered at runtime.
  dynamic ds = 'example';
  dynamic dl = [3, 43, 2];

  print('\ndynamic runtimeTypes:\n');
  print(di.runtimeType);
  print(ds.runtimeType);
  print(dl.runtimeType);

  // dynamic allows the type change in runtime
  di = 5.0;
  print(di.runtimeType);

  var f; // then var is infered to dynamic => dynamic f;
  f = 5;
  f = 4.0;
  f = 'string';
  var nullabledynamic;
  print(f);
  print(nullabledynamic); // Dynamic type is nullable
  // therefor dynamic is useful senario such as bellow
  List<dynamic> randomlist = [1, '3', 5.0];
  print(randomlist);
}

void final_const_demo() {
  print(
      "\n/////////////////////////final-const ///////////////////////////////////");
  const int b = 3;
  // int b = const interger(3); behind the scene , so the value 3 is by default constant
  final int a = 3;
  // a = 4; or b = 4 , reassignment not allowed in both
  int d = 3;
  int e = 3;
  int f = 3;
  print("below variables all points the same const value 3 thus same hashcode");
  print("d : ${d.hashCode}");
  print("e : ${e.hashCode}");
  print("f : ${f.hashCode}");
  print("a : ${a.hashCode}");
  print("b : ${b.hashCode}");

  const List cx = [3, 4, 5];
  // the whole line is made constant implies the underlying values cannot be reassigned also.
  // cx is const, then it means [3,4,5] is const
  final List fx = [3, 4, 5];
  List nx = [3, 4, 5];
  List dx = const [3, 4, 5];
  // underlying value of a final object(list) can be reassignmed.
  // meaning the final fx doesn't mean list [3,4,5] is const
  fx[0] = 5;
  fx[2] = 3;
  // fx = [7, 8 , 9]; // not allowed as fx is final
  // cx[2] = 3;  // runtime exception is raised here, operation not allowed
  print("cx $cx ${cx.hashCode}");
  print("dx $dx ${dx.hashCode}");
  print("fx $fx ${fx.hashCode}");
  print("nx $nx ${nx.hashCode}");
  print("cx and dx points the same const list");

  var cv = const [3, 6, 7];
  cv = [8, 9, 10]; // allowed
  print(cv);
  // [3,6,7] is const doesn't mean cv is const
  //cv[0] = 10; not allowed as [3,6,7] is const

  /*
- const variables will have the value known at the compile time.
- final variables will have the value known at the run time.
therefore you cannot assigne const to a var who will get the value at runtime ex.
    const x = somefun(); // will result in compile time error
    instead use final;
    final x = somefunction();
  */
}

void main() {
  nullableToplevel = 5;

  nonNullableTopLevel = 4;
  // print(nonNullableTopLevel);

  t = 9;

  print(A.s);

  var_dynamic_demo();
  final_const_demo();
}
