//Javascript is a high-level, object oriented, multi paradigm programming language


// 1. var const let
console.log('--------------------- var const let ---------------------->');
/*
ES5 - var
ES6 - const, let
1. var old js mein tha, let const new js mein hai

2.
var function scoped hota hai,
let braces scoped hota hai,

3.
var adds itself to the window object
let const doesn't add

* browser context api - window, stack and heap memory

- window object is something which allows javascript to use the browser functionalities
such as alert, clearInterval, document, prompt, console
- stack is used for tracking function call
- heap is used for storing intermediate variables and data.

* Execution context

- the execution context of a function contains the variables and functions it holds, and its
  lexical environment

  - lexical environment of any function of any variables contains what it can access 
    basically scope and scope chaining (accessing its parents variables and functions)
*/

function abcd() {
    // var is "function scoped" -> scope of the variables decalered using var is its 
    // whole parent function.
    console.log('--------- abcd() ------->');

    for (var i = 1; i < 12; i++) {
        console.log(i);
    }
    console.log(i);

    for (let i = 2; i < 5; i++) {
        console.log(i);
    }
    console.log(i);
    for (let x = 2; x < 5; x++) {
        console.log(x);
    }
    // console.log(x); this will produce error as let is "braces scoped" just like other languages
}
abcd();


function execution_env_demo() {
    console.log('--------- execution_env() ------->');
    var x = 54;
    function inside_exe() {
        var f = 23;
        console.log(x); // through scope chaining
        console.log(f); // its scope
    }
    inside_exe();
    // console.log(f); // error , as its out of scope
}
let x = 5;
execution_env_demo();

// ( hosting vs hoisting -- they are different)
// 2. hoisting - variable and functions are hoisted which means their declaration is moved on the top of the code.

console.log('--------------------- Hoisting ---------------------->');
console.log(a); // prints undefined 
// console.log(b); // prints not-defined (does not exist)
var a = 12;



// 3. Types in js
console.log('--------------------- Types in JS ---------------------->');

// primitives - number, string, null, undefined, boolean
// reference = [] () {}
// aisi koi bhi value jisko copy karne par real copy nahi hota, baki us main value ka 
// reference pass ho jata hai usko hum reference value kahte hai, aur jiska coopy karne par
// real copy ho jaaye wo value primitive type value hoti hai.

var a = 12;
var b = a;

b = b + 2;
console.log(a);
console.log(b);

var a = [1, 2, 3, 4];
var b = a;
console.log(a);
console.log(b);
b.pop();
console.log(a);
console.log(b);

// how do we truly copy reference value
console.log('--------- real copy ------->');
var c = [...a]; // using spread operator
c.pop();
console.log(c);
console.log(a);

var obj = { name: 'harsh' };
var copyobj = { ...obj };
copyobj.name = 'nisarg';
console.log(obj);
console.log(copyobj);


// 4. conditionals 
console.log('--------------------- conditionals ---------------------->');

console.log('--------- Truthy, Falsy ------->');

// falsy values - 0, false, undefined, null, NaN , document.all
// all others are truthy

if ("apple") {
    console.log('string');
}

if (-1) {
    console.log('-1');
}

if (0) {
    console.log('0');
}

if (NaN) {
    console.log('nan');
}


// 5. loops - for while
console.log('--------------------- loops ---------------------->');

for (var i = 0; i < 11; i++) {
    console.log(i);
}

console.log('--------- forEach ------->');
// we can use for each with arrays
var xx = [1, 2, 3, 4, 5, 6];
xx.forEach(function (val) {
    console.log(val);
});
xx.forEach((val) => {
    val = val + 2;
});
console.log(xx);

console.log('--------- forin ------->');

var obj = { name: 'nisarg', age: '22', city: 'ahm' };

for (var key in obj) {
    console.log(key, obj[key]);
}



// 6. Functions 
console.log('--------------------- functions ---------------------->');

function helobolo(x, b) {
    console.log('hello');
}

helobolo();

setTimeout(function () {
    console.log('--------- callback functions ------->');
    console.log("2 second baad chala");
}, 2000);

console.log('--------- first class functions ------->');
// we can use functions as values
function greetings(greeting, firstname) {
    var first_name = firstname();
    var finalgreet = greeting + ' ' + first_name;
    console.log(finalgreet);
}
function nisarg() {
    console.log('nisarg');
}
greetings('hey', nisarg);
greetings('hola', function () { console.log('payal'); });
greetings('hola',  ()=> console.log('payal'));

// 7. arrays
console.log('--------------------- arrays ---------------------->');

var arr = [1, 54, 32, 5, 35, 33];
console.log(arr);

arr.push(3); // Appends new elements to the end of an array, and returns the new length of the array.
console.log(arr);

arr.pop(); // Removes the last element from an array and returns it.
console.log(arr);

arr.unshift(3); // Inserts new elements at the start of an array, and returns the new length of the array.
console.log(arr);

arr.shift(); // Removes the first element from an array and returns it. 
console.log(arr);

arr.splice(3, 2); // Removes elements from an array 
// @param start — The zero-based location in the array from which to start removing elements.
// @param deleteCount — The number of elements to remove.
// @returns — An array containing the elements that were deleted.
console.log(arr);


// internally arrays are also objects

var arrobj = [33,42,23,21,34];
/*
internally
arrobj ={
    0:33,
    1:42,
    2:23,
    3:21,
    4:34,
}
*/
arrobj[-1]= 2;
console.log(arrobj);
// to identify if its array or object
console.log(Array.isArray([])); // returns true
console.log(Array.isArray({})); // returns false

// 8. objects
console.log('--------------------- objects ---------------------->');

// a) blank obj
var a = {};

// b) filled obj
var insan = {
    age: 23,
    name: 'harsh',
    email: "email@something.com",
    linkedin: 'ffd@harsh',
    contact: 9999324345,
    difd: false,
    kuchhbolo: function () { },
};
insan.age = 33;
console.log(insan);

delete insan.difd;
delete insan.name;
console.log(insan);
