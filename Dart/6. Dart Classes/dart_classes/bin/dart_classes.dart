/*
documentation : https://dart.dev/language/classes

CONTENTS
  1. Fields 
  2. Constructor
       - Default Constructor
       - Named Constructor
       - Inititalizers list
       - Redirecting Constructor
       - Const Constructor
       - Factory Constructor
  5. Methods - static , intant , operator
  6. Singleton Class

*/

import 'dart:math';

/*
every class we create invisibly extends the object class

- To create a private field , add underscore in front of the variable name.
  setting a field private implies that it can only be access from the file 
  in which it was created.

In Java, we can use public, protected, and private keywords to control the
access scope for a property or method. However, Dart doesn't provide that kind 
of keywords. Instead, you can use _ (underscore) at the start of the name to 
make a data member of a class becomes private.

In Dart, the privacy is at library level rather than class level. It means 
other classes and functions in the same library still have the access. So, 
a data member is either public (if not preceded by _) or private (if preceded by _)
*/

////////////////////////////////// 1. Fields //////////////////////////////////////

class A {
  int? _private; // private field

  int? a;
  int b = 1;

  final int c = 2; // cannot be intialized outside of this class body

  late int d;
  late final int e;

  static int f = 5;
  static late int g;
  static late final int h;

  static const int i = 8;
}

void instant_variables_demo() {
  var alfa = A();
  print(alfa.toString()); //toString() is a method of Object class
  print("\n Instance Variables \n");
  print('alfa._private; --> ${alfa._private}');
  print('alfa.a; --> ${alfa.a}');
  print('alfa.b; --> ${alfa.b}');
  print('alfa.c; --> ${alfa.c}');
  alfa.d = 3;
  print('alfa.d; --> ${alfa.d}');

  alfa.e = 4;
  // alfa.e = 5; -- error
  print('alfa.e; --> ${alfa.e}');
  print('A.f; --> ${A.f}');
  A.g = 6;
  print('A.g; --> ${A.g}');
  A.h = 7;
  print('A.h; --> ${A.h}');
  print('A.i; --> ${A.i}');
}

////////////////////////////////// 2. Constructors //////////////////////////////////////

// Constructors demo
class B {
  final int x;
  final int y;
  int? z;
  late int w;

  B({required this.x, required this.y}) {
    // Constructor B(x,y)
    z = 0;
    w = 0;
  }

  B.xzero(int y, int z, this.w) // constructor B.xzeroo(y,z,w);
      : x = 0,
        this.y = y {
    this.z = z;
  }

  // redirecting constructor
  // they cannot have any body or cannot use initializer field
  // they just redirect the flow to another contructor with some field tweeks.
  B.xyzero({required int z, required int w}) : this.xzero(0, z, w);

  B.zero() // Constructor B.zero();
      : x = 0,
        y = 0,
        z = 0,
        w = 0;

  B.fromJson({required Map<String, int> json})
      : x = json['x']!,
        y = json['y']!,
        z = json['z'],
        w = json['w']!;

  @override
  String toString() => 'B(x: $x, y: $y, z: $z, w: $w)';
}

void constructor_demo() {
  print("\n Constructors \n");

  B Beta = B(x: 4, y: 3);
  B Beta2 = B.zero();
  B Beta3 = B.xzero(3, 2, 1);
  B Beta4 = B.fromJson(json: {'x': 4, 'y': 3, 'w': 2, 'z': 1});
  B Beta5 = B.xyzero(w: 3, z: 1);

  print('beta           --> $Beta'); // $Var => Var.toString()
  print('beta zero      --> $Beta2');
  print('beta xzero     --> $Beta3');
  print('beta xyzero    --> $Beta5');
  print('beta from json --> $Beta4');
}

//////////////////////// Const/Factory Constructors , Methods  ///////////////////////////

class Point {
  final int x;
  final int y;
  // constant contructor
  const Point(this.x, this.y);
  static const Point origin = Point(0, 0);

  // Generates a random point (FACTORY CONSTRUCTOR)
  factory Point.random({required bool isPositive}) {
    // Factory contructor doen't have access to this keyword
    int minNegative = -99;
    int maxNegative = -1;
    int minPositive = 0;
    int maxPositive = 99;

    int randomNegative =
        minNegative + Random().nextInt(maxNegative - minNegative);
    int randomPositive =
        minPositive + Random().nextInt(maxPositive - minPositive);
    // Factory constructor must endup returining the instant of the
    // same class it was declared in
    return isPositive
        ? Point(randomPositive, randomPositive)
        : Point(randomNegative, randomNegative);
  }
  // instant method
  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  // Static method
  static double distancebetween(Point pointA, Point pointB) {
    var dx = pointA.x - pointB.x;
    var dy = pointA.y - pointB.y;
    return sqrt(dx * dx + dy * dy);
  }

  // operator + and -
  Point operator +(Point v) => Point(x + v.x, y + v.y);
  Point operator -(Point v) => Point(x - v.x, y - v.y);

  @override
  bool operator ==(Object other) =>
      other is Point && x == other.x && y == other.y;

  @override
  String toString() => 'Point(x: $x, y: $y)';
}

void constConstructorDemo() {
  print("\n Const Constructors \n");
  var p1 = Point(1, 1);
  var p2 = Point(1, 1);
  var p3 = const Point(1, 1);
  var p4 = const Point(1, 1);
  print("P1 : ${p1.hashCode}");
  print('P2 : ${p2.hashCode}');
  print('P3 : ${p3.hashCode}');
  print('P4 : ${p4.hashCode}');
  print('only p3 and p4 points to the same location in the memory');

  const listOfPoints = [Point(1, 1), Point(1, 2), Point(1, 1)];
  print('listOfPoints[0] : ${listOfPoints[0].hashCode}');
  print('listOfPoints[2] : ${listOfPoints[2].hashCode}\n');

  print(
      'you can see that 1st and 3rd points in list of points\nwhich are also (1,1) points to same location as p3 and p4\n');
}

void factoryConstructor() {
  print("\n Factory Constructors \n");
  var random1 = Point.random(isPositive: true);
  var random2 = Point.random(isPositive: false);
  print('Random point 1 = $random1');
  print('Random Point 2 = $random2');
}

void methods_demo() {
  print("\n Methods \n");
  final Point v = Point(2, 3);
  final Point w = Point(2, 2);

  print("v = (2,3) , w = (2,2)");
  print('${v + w} == ${Point(4, 5)}');
  print('${v - w} == ${Point(0, 1)}');
  print('distance between v and w = ${Point.distancebetween(v, w)}'); // static method

}

////////////////////////////////// 6. Singleton Class //////////////////////////////////////

// Implementing Singleton class using factory constructor
class Singleton {
  Singleton._privateConstructor();
  static final _instance = Singleton._privateConstructor();
  factory Singleton() => _instance;
}

void singletonClass() {
  print("\n Singleton Class \n");
  var s1 = Singleton();
  var s2 = Singleton();
  var s3 = Singleton();
  print("all s1 s2 s3 will be pointing to single instance");
  print('s1 ${s1.hashCode}');
  print('s2 ${s2.hashCode}');
  print('s3 ${s3.hashCode}');
}

void main(List<String> arguments) {
  instant_variables_demo();
  constructor_demo();
  constConstructorDemo();
  factoryConstructor();
  methods_demo();
  singletonClass();
}
