// Inheritance between classes using constructor function
// obsidian://open?vault=Documents&file=Technical%20Learning%2FJavaScript%2F9.%20OOP

console.log("\n<------------ prototype inheritance b/w classes ------------>\n");

const Person = function(firstName,birthYear){
    this.firstName = firstName;
    this.birthYear = birthYear;
};

const Student = function(firstName,birthYear,course){
    Person.call(this,firstName,birthYear); 
    // normal function call would have "this" as "undefined", thus we use call method to
    // specify the "this" which would be the empty student object for which the Person 
    // function will create two properties using "this"
    this.course = course;
}

Person.prototype.calcAge = function(){
    console.log('age : ',2023-this.birthYear);
}

// Linking prototypes
Student.prototype = Object.create(Person.prototype); 
// returns a object which has a link (__proto__) to Person.prototype
// thus Student.prototype now points to Person.prototype using __proto__

Student.prototype.introduce = function(){
    console.log(`My name is ${this.firstName} and I am taking ${this.course} course`);
};

const nisarg = new Student('nisarg',2000,'CSE');

nisarg.introduce();
nisarg.calcAge();

console.log("\n<------------ Demonstrating prototype chain ------------>\n");

console.log(Student.prototype);
console.log(nisarg);

console.log("\n<-------------1----------->\n");

console.log(nisarg.__proto__); 
// Person.prototype -> this is wrong it should be Student.prototype
console.log(nisarg.__proto__.__proto__); // Person.prototype

console.log("\n<------------2------------>\n");


// Points to Person , as we created Student.prototype object using object.create(Person
// prototype) which will make the default constructor property point back to Person.
console.log('before: ',Student.prototype.constructor); 
Student.prototype.constructor = Student;
console.log('after: ', Student.prototype.constructor); 

const nikhil = new Student('nikhil',2001,'EC');

console.log(nikhil.__proto__); 
console.log(nikhil.__proto__.__proto__);

console.log("\n<------------3------------>\n");

console.log(nikhil instanceof Student); // True
console.log(nikhil instanceof Person); // True
console.log(nikhil instanceof Object); // True

