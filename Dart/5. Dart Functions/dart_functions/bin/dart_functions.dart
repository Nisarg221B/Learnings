/*
documentation : https://dart.dev/language/functions


CONTENT 
- Functions
  - Functions as class
      - assigning function to a variable of type "Funtion"
      - passing function as argument
      - returning function from a function
  - Lamdas and Clouser (nameless functions)
  - Paramenters
      - Named (optional and required)
      - Positional (optional and required)
*/

//----------------------------------------------------------------------------
//     FUNCTIONS

/*
Dart is a true object-oriented language, so even functions are objects and 
have a type, "Function". This means that functions can be assigned to 
variables or passed as arguments to other functions. You can also call 
an instance of a Dart class as if it were a function.
*/

int sum_ints(int a, int b) {
  // recommended to annotate the return type
  return (a + b);
}

sum_ints2(int a, int b) {
  // still works though
  return (a + b);
}

// The => expr syntax is a shorthand for { return expr; }. The => notation is sometimes referred to as arrow syntax.
int sum3(int a, int b) => (a + b);

// function containg a function as an argument
int multiply_with_add(Function sum, int a, int b) {
  return (sum(a, b) + a * b);
}

// Returning funciton from another function
Function third_sum() {
  return (a, b, c) => (a + b + c);
}

void funcx(int a, int b) {
  print(a);
  // returns null; // by default
}

String toUppercase(String s) => (s.toUpperCase());

// parameters
void requiredPositional(int a, int b) =>
    print('Required Positional = a-$a b-$b');

void optionalPositional([int? a, int b = 2, int? c]) =>
    print('Optional Positional = a-$a b-$b c-$c');

void requiredNamed({required int a, required int b}) =>
    print('Required Named = a-$a b-$b');

void optionalNamed({int? a, int? b, int c = 3}) =>
    print('Optional Named = a-$a b-$b c-$c');

void namedHybrid({required int a, int b = 10, int? c}) =>
    print("Named Hybrid = a-$a b-$b c-$c");

void positionHybrid(int a, int b, [int? c, int d = 3]) =>
    print("PositionalHybrid = a-$a b-$b c-$c d-$d");

//  Lexical closures
/// Returns a function that adds [addBy] to the
/// function's argument.

/*
A closure is a function object that has access to variables in its lexical scope, 
even when the function is used outside of its original scope.

Functions can close over variables defined in surrounding scopes. In the 
following example, makeAdder() captures the variable addBy. Wherever the 
returned function goes, it remembers addBy.
*/

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main(List<String> arguments) {
  print("\n Functions \n");
  Function functionobject = sum_ints;
  int a = 2;
  int b = 3;
  // (2+3) + 2*3 = 11
  print(multiply_with_add(functionobject, a, b));

  Function sum3 = third_sum();
  // 5 + 6 + 2 = 12
  print(sum3(5, 6, 2));

  print("\n Lamdas and Clousers \n");

  // Lamdas and Closures - anonymous functions ( functions that don't require name)
  var list = ['hello', 'this', 'is', 'string', 'list'];
  print(list);

  // make the above list in all upparcase elements with named function written above.
  var list2 = list.map(toUppercase).toList();
  print(list2);

  // with anonymous function , (String s) => s.toLowerCase()
  /*
    An a nonymous function looks similar to a named function—zero or more parameters,
    separated by commas and optional type annotations, between parentheses.
    
    The code block that follows contains the function’s body:

    ([[Type] param1[, …]]) {
      codeBlock;
    };
  */
  var list3 = list2.map((String s) => s.toLowerCase()).toList();
  list3 =
      list2.map((s) => s.toLowerCase()).toList(); // to write type is optional

  print(list3);

  // Parameters
  print("\n Parameters \n");
  requiredPositional(3, 4);
  requiredNamed(b: 4, a: 3);
  optionalPositional(3); // void optionalPositional([int? a, int b = 2, int? c])
  optionalNamed(b: 3); // optionalNamed({int? a, int? b, int c = 3})
  namedHybrid(a: 4); // namedHybrid({required int a, int b = 10, int? c})
  positionHybrid(3, 2); // positionHybrid(int a, int b, [int? c, int d = 3])

  print("\n Lexical closures \n");
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  print(add2(3)); // should return 5;
  print(add4(3)); // should return 7;
}
