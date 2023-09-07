'use strict'
/*
INDEX

- Default Parameters
- Value vs. Reference
- First Class and Higher Order functions
- Function returning function and callback functions
- Call and Apply methods
- The Bind Method
- 
 
*/
console.log('\n----------Default Parameters----------\n')

const bookings = [];

const createBooking = function (flightNum, numPassengers = 1, price = 199 * numPassengers) {
    // ES5
    // numPassengers = numPassengers || 1; 
    // whenever numPassenger is a falsy value the or operator (||) will asign it to 1
    // price = price || 199;

    // ES6
    // in ES6 we can directly specify the default values in parameter 
    const booking = {
        flightNum,
        numPassengers,
        price,
    };
    console.log(booking);
    bookings.push(booking);
}

createBooking('LH123');
createBooking('LH124', 2, 399);
createBooking('LH124', 5);
createBooking('LH134', undefined, 1000); // skipping a default parameter by using undefined



console.log('\n----------Value vs. Reference----------\n')

const flight = 'LH233';
const nisarg = {
    name: 'nisarg patel',
    passport: 3243215432,
};

const checkIn = function (flightNum, passenger) {
    flightNum = 'LH999',
        passenger.name = 'Mr. ' + passenger.name;

    if (passenger.passport === 3243215432) {
        console.log('checkin');
    }
    else {
        console.log('Wrong Passport');
    }
}

checkIn(flight, nisarg);
console.log(flight, '\nthis would not haved changed as the primitives would be passed by value');
console.log(nisarg, '\nthe name here changed as expected as objects are reference type');


// In javascript we only have pass by value, we don't have pass by reference
// the objects which are of reference type are also values which are passed on, not their references.


console.log('\n----------First Class and Higher Order functions----------\n')

const oneWord = function (str) {
    return str.replace(/ /g, '').toLowerCase();
    // we use / /g this regular expression with g flag to select all the space and replace it with ''
}

const upperFirstWord = function (str) {
    const [first, ...others] = str.split(' '); // destructuring 
    return [first.toUpperCase(), ...others].join(' ');
}

// Higher order function
const transformer = function (str, fn) {
    console.log(`Original String: ${str}`);
    console.log(`Transformed String: ${fn(str)}`);

    // besides methods functions also have properties
    console.log(`Transformed by: ${fn.name}\n`); // name property
}

transformer('JavaScript is the best!', upperFirstWord);
transformer('JavaScript is the best!', oneWord);


// const high5 = function(){
//     console.log('helloooooo');
// }

// // high order function 
// document.body.addEventListener('click',high5); // high5 - call back function

// here upperFirstWord is a callback function
// and thus forEach a high order function
let statements = ['this is python', 'Hello from C++', 'java naam hi kafi hai']
console.log(statements);
statements.forEach((val, index, arr) => {
    val = upperFirstWord(val);
    arr[index] = val;
});

console.log(statements);


console.log('\n----------Function returning function----------\n')

const greet = function (greeting) {
    return function (name) {
        console.log(`${greeting} ${name}`);
    }
}

const greeterHey = greet('hey');
// greeterHey remembers the greeting variable 'hey' , which is function closure
// look more for it in function closure file.
greeterHey('nisarg');
greeterHey('payal');
greet('hello')('nikhil');


const greetArrow = (greeting) => (GreetedName) => console.log(`${greeting} ${GreetedName}`);

greetArrow('baaam')('javascript');


console.log('\n----------Call and Apply methods----------\n')

const IndianAirline = {
    airline: "Air India",
    iataCode: 'AI',
    bookings: [],
    // book : function(){}
    // newer syntax
    book(flightNum, name) {
        console.log(`${name} booked a seat on ${this.airline} flight ${this.iataCode}${flightNum}`);
        this.bookings.push({ flight: `${this.iataCode}${flightNum}`, name })
    },
};


IndianAirline.book(234, 'Nisarg Patel');
IndianAirline.book(342, 'Payal Panjwani');

console.log(IndianAirline);

const book = IndianAirline.book;
// book(234,"nidarg Pate")  // Error
// will cause error as ,here this book function is just a regular function call,
// and for regular function calls this keyword is undefined

// so how do we tell javascript explicitly what should this function look like
// we use call and bind methods.
book.call(IndianAirline,233,'Nishant Mishra');
console.log(IndianAirline);

const eurowings = {
    airline: "Eurowings",
    iataCode: 'EW',
    bookings: [],
};

book.call(eurowings,323,'nisarg patel');
console.log(eurowings);

// Apply method does the same thing, it just takes and list after this keyword,
// for all the other parameters

const flightData = [422, 'Nikhil Gupta'];
book.apply(eurowings,flightData);
console.log(eurowings);

// Apply method is not used any more as we can use spread operator with call method
book.call(IndianAirline, ...flightData); // use spread out the arguments from the array
console.log(IndianAirline);


console.log('\n---------- The Bind Method ----------\n')

const bookEurowing = book.bind(eurowings); // permenantly binding this to a object
bookEurowing(234, 'Nikshan');
console.log(eurowings);

// partial application - preseting certain parameters
const bookEurowing23 = book.bind(eurowings,23); //you can also preset other arguments 

bookEurowing23('payal');
console.log(eurowings);

// Parital application ex 2
const addTax = (rate,value) => value + value *rate;

console.log(addTax(0.1,200));

const addVAT = addTax.bind(null,0.23); // presetting value

console.log(addVAT(300));



