"use strict";

/*

obsidian://open?vault=Documents&file=Technical%20Learning%2FJavaScript%2F9.%20OOP

# 1. Constructor functions
- Technique to create objects from a function;
- This is how build in objects like arrays, maps, or set are actually implemented.

*/

// Constructor function
console.log("\n<------------ Constructor Function ------------>\n");

const Person = function (firstName, birthYear) {
  // console.log(this); // Person {}
  this.firstName = firstName;
  this.birthYear = birthYear;

  // Never create a method inside a constructor function
  // instead use prototype and prototype inheritance
  // as doin this, this function will get copied to all the instances
  this.calAge = function () {
    this.age = 2023 - this.birthYear;
    // console.log(this.age);
  };
  this.calAge();
};

const nisarg = new Person("nisarg", 2000);
console.log(nisarg);

// 1. New {} empty object is created
// 2. function is called and in this function call this keywork will point to {} new object
// 3. {} linked to prototype -> creates a __proto__ property and sets its value to the prototype perperty of the function this is being called.
// 4. function automatically return {}

const payal = new Person("Payal", 2001);
console.log(payal);

console.log(nisarg instanceof Person);

console.log("\n<------------ Prototype ------------>\n");

// each and every function in javascript has property called prototype

// Inherited prototype method
Person.prototype.calAgePrototype = function () {
  console.log(2023 - this.birthYear);
};

payal.calAgePrototype();
console.log(payal); 
// payal do not contain calAgePrototype method, but we still has access to it
// due to prototypal inheritance.
console.log(payal.__proto__); // true
console.log(payal.__proto__ === Person.prototype); // true


console.log(Person.prototype.isPrototypeOf(payal)); // true
console.log(Person.prototype.isPrototypeOf(nisarg)); // true
console.log(Person.prototype.isPrototypeOf(Person));  // false
/*
the prototype property is not the prototype of Person, but instead it is whats going
to be used as prototype of all the objects which are going to be created using
Person constructor function

prototype ==> prototyeOfLinkedObjects
*/

Person.prototype.species = 'Homo Sepians'; // Inherited property
console.log(nisarg,nisarg.__proto__);
console.log(nisarg.species);

console.dir(Person.prototype.constructor); // Function Person itself
console.log(nisarg.hasOwnProperty('firstname')); 
console.log(nisarg.hasOwnProperty('species'));
// hasOwnProperty is method of object prototype 
console.log(nisarg.__proto__.__proto__); // Object.prototye

console.log("\n<------------ build in Prototype ------------>\n");

// built in prototype 
const arr = [3,52,2,2,2,3,2,4,5,6]; // new Array === []
console.log(arr.__proto__);
console.log(arr.__proto__ === Array.prototype);

// extending build in prototype ( not a good idea )
Array.prototype.unique = function(){
  return [...new Set(this)]
}

console.log(arr.unique());



console.log("\n<------------ Static Methods ------------>\n");

Person.hey = function(){
    console.log('hey there');
}
Person.hey();