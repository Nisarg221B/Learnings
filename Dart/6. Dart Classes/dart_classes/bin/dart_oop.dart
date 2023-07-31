/*
documentation : https://dart.dev/language/extend

CONTENTS
  - Type Hierarchy
      - Extend keyword
      - method overriding (@override)
      - covarient keyword 
  - Abstract class
      - Explicit abstract class ( abstract keyword)
      - Implicit abstract classes ( all the classes in dart)
      - keyword "External" 
      - Interfaces ("implements" keyword)
  - Single Inheritance (Deadly Diamond of Death)(DDD)
  - Mixins
      - with keyword
      - on keyword
      - mixin written order ( class heirarchy of function call )
*/

/*

  A dart class can only extend one single class
  
  Every dart class by default extends object class, 
  but if it explicity mentioned that it extends classB the Object class is
  replaced by that classB and classB (which already extends the Object class).

  In below case 
  Bird extends Animal , and Animal extends Object , therefore Bird extends Object too.
*/

////////////////////////////////// 1. Type Heirarchy //////////////////////////////////////

class Animal {
  final String name;
  Animal({required this.name});

  void whatAmI() => print("I'm an animal");
  external void chase(
      Animal a); // 2.3 abstract method outside of abstract class
}

class Mouse extends Animal {
  Mouse() : super(name: 'Jerry');
}

class Cat extends Animal {
  Cat() : super(name: 'Tom');
  /*
  //! void chase(Animal m){}  (wrong logic)
  // not right as cat cannot case every animal(eliphant) there for it needs to be overriden

    @override
    void chase(Mouse a){} // Gives an Error
    the function isn't a valid override of 'Animal.chase' , as not every animal is a mouse
    technically its tightning the type animal by replacing it with its subclass.
  */
  @override
  void chase(covariant Mouse m) {}
}

class Bird extends Animal {
  Bird(String name) : super(name: name);
}

class Duck extends Bird {
  Duck(String name) : super(name);

  final bool swim = true;

  @override
  void whatAmI() => print("I'm a duck!");
}

////////////////////////////////// 2. Abstract class //////////////////////////////////////

/*
      interface or abstract class ( same in dart ) is an contract or overview of the to-be
      implemented methods in the subclass.
      
      - abstract class cannot be instantiated
      - all the methods and feilds inside an abstract class are by default abstract.
      - you can make a method or feild abstract outside of abstract class by "external" keyword
            external void chase(Animal a);

      extends - only one class
      implements - one or more classes 
      - You can extend only one class but implement one or more interfaces.

      The difference is just that , you have to implement all the methods and feilds 
      in this class weather they are implemented or not or make the class abstract.
      but when you extend a class , you may or may not override the methods or write the 
      implementation of abstract method present in the base class.

      - All the classes in dart are (implicit) interfaces by default thus can be 
        implemented by any other class.
      - to explicit interface we use abstract keyword.
*/

abstract class userRepositoryInterface {
  late final List<int>? userslist;
  void create();
  List<int> read();
  void update();
  void delete();
}

class A {
  void methodA() {}
}

class B {
  void methodB() {}
}

class C {
  void methodC() {}
}

class D implements A, B, C {
  @override
  void methodA() {
    print('Method A implemented in D');
  }

  @override
  void methodB() {
    print('Method B implemented in D');
  }

  @override
  void methodC() {
    print('Method C implemented in D');
  }
}

class UserRepository implements userRepositoryInterface {
  @override
  List<int>? userslist;

  UserRepository() {
    userslist = read();
  }

  @override
  void create() {
    print('Created');
  }

  @override
  List<int> read() {
    return List.empty();
  }

  @override
  void update() => print('Updated');

  @override
  void delete() => print('deleted');
}

////////////////////////////////// 3. DDD //////////////////////////////////////

/*

why dart only allows single inheritance ??

Deadly Diamond of Death (DDD) 

|                              class Performer - void perform()
|                                              |
| class Guitarist extends Performer            |         class Drummer extends Performer
|   -@override void perform()                  |             -@override void perform()
|                                 
|                          class Musician extends Guitarist,Drummer

You can observe that theres a deadly deadlock here the object of the class Musician
inherits both the perform methods from Guitarist and Drummer which is logicially 
correct but the program won't be able to decide which perform method to use, therefore
using multiple inheritance coulbe potentially be a bad idea.

therefore dart allows only single inheritance.

but logically a musician can be a guitarist as well as a drummer , how do we implement 
this in dart - through mixins;

*/

////////////////////////////////// 4. Mixins //////////////////////////////////////

/*

- A class with no constructor 
- A class of which behavior can be shared with other classes


Using the mixin keyword
- to use mixin with a class use "with" key word
- to define mixin on a class use "on" keyword

with mixim the program will able to identify which method to call in case of conflict
by the written order. ( see below )
 -- The order in which yo write the mixims after the with keyword matters.

-- A mixin cannot be instantiated , it cannot have a constructor
-- A mixin that mixes in with other class can use its methods and can even override some of them.

*/

class Performer {
  void perform() => print("Performs!");
}

mixin Guitarist on Performer {
  void playGuitar() => print("Playing the guitar");
  @override
  void perform() => playGuitar();
  void test3() => super.perform(); // invokes the Performers perform method
}

mixin Drummer{
  void playDrum() => print("Playing the Drum");
  void perform() => playDrum();
}

// in order to use the mixin Pianist the subclass must extend the performer class
mixin Pianist on Performer {
  void playPiano() => print("Playing the piano");
  void test() => perform(); // see the method main
  void test2() => super.perform(); // invokes the Guitarists perform method not Performers
}

//                                     (the order here matters)
class Musician extends Performer with Guitarist, Pianist, Drummer {
  // no need to implement any methods with mixins as oppose to implement keyword
  void test4() => super.perform();
}

/*
1.
 --> Performer is mix in with Guitarist, Pianist and Drummer ( respectively ) not musician
 --> Musician extends performer

therefore the class heirarchy is below
2.
 --> Performer
 --> Guitarist    (super -> Performer)  // because of ON keyword
 --> Pianist      (super -> Guitarist)  // because of ON keyword
 --> Drummer                            // independent of Performer
 --> Musician     (super -> Drummer )

so the closest class above the musician class is drummer , thus drummers perform method
is invoked.
*/
void main() {
  Musician m = Musician();
  m.playDrum();
  m.playGuitar();
  m.perform(); // the drummer-perform method is invoked because of class heirarchy

  print("\ntests .... for class heirarchy\n");
  m.test(); //(test - Pianist) the drummer-perform because of the same above reason.
  /*
  from the musician class perspective
  all the methods insides the mixims and extended classes are available in the musician
  class therefor it uses only the class heirarchy to decide which method to invoke.
  in this case
  test() (Pianist) --> perform()
                   --compiler see the heirarchy--> --Decides its drummer--
                   --> perform() (drummer) is invoked
  */

  m.test2(); // (test2 - Pianist)   invokes the guitarists perform method.
  m.test3(); // (test3 - Guitarist) invokes the performers perform method.
  m.test4(); // (test4 - Musisian)  invokes the drummers perform methd.
}
