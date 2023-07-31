/*
documentation : https://dart.dev/null-safety/understanding-null-safety#nullability-in-the-type-system

local :
obsidian://open?vault=Documents&file=Technical%20Learning%20Notes%2FDart%2F3.%20null_saftey%2Fdart-null%20safety


Content 
1. Keyword ?
2. Never Type
3. Initializing variables at different level 
4. Control flow analysis
5. Working with nullable type
      a. null aware operator (?)
      b. null assertion operator (!)
      c. late variables 
            - Lazy initialization 
            - Late final variables
6. Parameters
*/

///////////////////////////////////////////////////////////////////////////////

// 1. Keyword ?

// Using null safety

makeCoffee(String coffee, [String? dairy]) {
  if (dairy != null) {
    print("$coffee with $dairy");
  } else {
    print("Black $coffee");
  }
}
/*
Here, we want to allow the dairy parameter to accept any string, or the value null, 
but nothing else. To express that, we give dairy a nullable type by slapping ? at 
the end of the underlying base type String.

The only methods and properties we can safely let you access are ones defined by both 
the underlying type and the `Null` class. That’s just `toString()`, `==`, and 
`hashCode`. So you can use nullable types as map keys, store them in sets, 
compare them to other values, and use them in string interpolation, 
but that’s about it
*/

///////////////////////////////////////////////////////////////////////////////

// 2. Type Never

/* The never type was added at the bottom of the type tree and can be used to interrupt
  the flow of an application, by throwing an exception. */

Never wrongtype(String type, Object value) {
  throw ArgumentError('Expected $type, but was ${value.runtimeType}.');
}

///////////////////////////////////////////////////////////////////////////////

// 3. Assigning Variables

// a. top level variables must be assigned at the point of declaration.
int x = 3;
/*
  b. 
  Instance fields must either have an initializer at the declaration, 
  use an initializing formal, or be initialized in the constructor’s 
  initialization list.
  */

class SomeClass {
  int atDeclaration = 0;
  int initializingFormal;
  int initializationList;

  SomeClass(this.initializingFormal)
      : initializationList = 0; //constructor initialization list
}
// as long as the field has a value before you reach the constructor body, you’re good.

/*
  c. 
  Local variables are the most flexible case. 

  A non-nullable local variable doesn’t need to have an initializer. 
  The rule is only that a local variable must be definitely assigned before it is used.

  Make the type nullable and then get the default initialization to null.
  */

///////////////////////////////////////////////////////////////////////////////

// 4. Control flow analysis

// 4a. Reachablility analysis

/*
      type promotion isn’t smart about early returns and other unreachable code paths.
      When analyzing a function, it now takes into account return, break, throw, and 
      any other way execution might terminate early in a function. Under null safety, 
      below function isEmptyList:

      Is now perfectly valid. Since the if statement will exit the function when 
      object is not a List, Dart promotes object to be List on the second statement. 
      This is a really nice improvement that helps a lot of Dart code, 
      even stuff not related to nullability.
*/

bool isEmptyList(Object object) {
  if (object is! List) return false;
  return object.isEmpty; //! return (object as list).isEmpty
}
///////////////////////////////////////////////////////////////////////////////

// 4b. Type promotion on null check
// using  ==null and !=null

String makeCommand(String executable, [List<String>? arguments]) {
  var result = executable;
  if (arguments != null) {
    result += ' ' + arguments.join(' '); // arguments which war nullable is
  }
  return result;
}

/*
Here, arguments has a nullable type. Normally, that prohibits you from calling .join() 
on it. But because we have guarded that call in an if statement that checks to 
ensure the value is not null, Dart promotes it from List<String>? to List<String> 
and lets you call methods on it or pass it to functions that expect non-nullable lists.
*/

///////////////////////////////////////////////////////////////////////////////

// 5. Working with nullable types

// 5a. null aware operator

String? getstring() {
  return 'hello';
}

void nullawareDemo() {
  String? notAString = null;
  print(notAString?.length.isEven); // expression evaluates to null
  /* When you use a null-aware operator in a method chain,
   if the receiver evaluates to null, then the entire rest of the 
   method chain is short-circuited and skipped. */
  
  // use it when you only want a function to be called if the variable is not null
  String? fff = getstring();
  print(fff?.isEmpty); // if fff is null then it will print null. the function call happens only if fff is not-null
}

///////////////////////////////////////////////////////////////////////////////

// 5b. null assertion operator

// Using null safety, incorrectly:

/*

class HttpResponse {
  final int code;
  final String? error;

  HttpResponse.ok()
      : code = 200,
        error = null;
  HttpResponse.notFound()
      : code = 404,
        error = 'Not found';

  @override
  String toString() {
    if (code == 200) return 'OK';
    return 'ERROR $code ${error.toUpperCase()}'; // error
  }
}

“Casting away nullability” comes up often enough that we have a new 
shorthand syntax. A postfix exclamation mark (!) takes the expression 
on the left and casts it to its underlying non-nullable type. 

Of course, like any cast, using ! comes with a loss of static safety

So the above function is valid as written below : 
*/

// Using null safety, with as:
class HttpResponse2 {
  final int code;
  final String? error;

  HttpResponse2.ok()
      : code = 200,
        error = null;
  HttpResponse2.notFound()
      : code = 404,
        error = 'Not found';

  @override
  // Using null safety:
  String toString() {
    if (code == 200) return 'OK';
    return 'ERROR $code ${(error as String).toUpperCase()}';
  }
}

// Using null safety, with assertion
class HttpResponse3 {
  final int code;
  final String? error;

  HttpResponse3.ok()
      : code = 200,
        error = null;
  HttpResponse3.notFound()
      : code = 404,
        error = 'Not found';

  @override
  // Using null safety:
  String toString() {
    if (code == 200) return 'OK';
    return 'ERROR $code ${error!.toUpperCase()}';
  }
}

///////////////////////////////////////////////////////////////////////////////

// 5c. late variables

/*
In below code, the heat() method is called before serve(). That means _temperature will 
be initialized to a non-null value before it is used. 

But it’s not feasible for a static analysis to determine that , 
Because the type checker can’t analyze uses of fields and top-level variables
thus it has a conservative rule that non-nullable fields have to be initialized either 
at their declaration (or in the constructor initialization list for instance fields).

```
// Using null safety, incorrectly:
class Coffee {
  String _temperature; // 

  void heat() { _temperature = 'hot'; }
  void chill() { _temperature = 'iced'; }

  String serve() => _temperature + ' coffee';
}

main() {
  var coffee = Coffee();
  coffee.heat();
  coffee.serve();
}
```


To get arround it we can use two methods
a. make the temperatur nullable -> String? _temperature;
      and use it as _temperature! whereever needed

      but this is not the proper way
b. To use late modifier 
    The late modifier means “enforce this variable’s constraints at 
    runtime instead of at compile time”
*/

// a. nullable (not a proper way)
class Coffee {
  String? _temperature;

  void heat() {
    _temperature = 'hot';
  }

  void chill() {
    _temperature = 'iced';
  }

  String serve() => _temperature! + ' coffee';
}

// b. using late modifier

class Coffee2 {
  late String _temperature;
  void heat() {
    _temperature = 'hot';
  }

  void chill() {
    _temperature = 'iced';
  }

  String serve() => _temperature + ' coffee';
}

// using late for lazy initialization
int _readThermometer() {
  return 2;
}

class Weather {
  late int _temperature = _readThermometer();
  /* the initializer becomes lazy. Instead of running it as soon as the instance
  is constructed, it is deferred and run lazily the first time the field is accessed */
  Weather() {
    print(_temperature); // the _readThermometer() function will be runned here
  }
}

// using late with final

/*
Unlike normal final fields, you do not have to initialize the field in its declaration 
or in the constructor initialization list. You can assign to it later at runtime. 
But you can only assign to it once, and that fact is checked at runtime. 
If you try to assign to it more than once—like calling both heat() and chill() 
here—the second assignment throws an exception. This is a great way to model state 
that gets initialized eventually and is immutable afterwards.
see below:
*/

class Coffee3 {
  late final String _temperature;

  void heat() {
    _temperature = 'hot';
  }

  void chill() {
    _temperature = 'iced';
  }

  String serve() => _temperature + ' coffee';
}

///////////////////////////////////////////////////////////////////////////////

//6. Parameters

/*
            mandatory                      optional
            +-------------------------+--------------------------------+
positional  | f(int x,int y)          |     f([int? x,int y = 3])      |
            +-------------------------+--------------------------------+
named       | f({required int? x})    |     f({int? x,int y= 3})       |
            +-------------------------+--------------------------------+
*/

function({int? a, required int? b, int? c, required int? d}) {}

/*
In above function

The parameters a and c are optional and can be omitted. The parameters b and d 
are required and must be passed. 

Note that required-ness is independent of nullability. You can have required 
named parameters of nullable types, and optional named parameters of 
non-nullable types (if they have a default value).
*/
