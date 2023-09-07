
'use strict';

// This file will not get demonstrated in node. use browser

console.log(this); // window

const calAge = function (birthyear) {
    console.log(2023 - birthyear);
    console.log(this); // undefined
};

const calAgeArrow = (birthyear) => {
    console.log(2023 - birthyear);
    console.log(this); // window ( as global this keyword)
};

const nisarg = {
    firstName: 'Nisarg',
    year: 2000,
    calcAge: function () {
        console.log(this);
        console.log(2023 - this.year);
        const self = this;

        const isGenZ = function () {
            // below code produces error as , this in a regular function call is undefined
            // console.log(this.year >= 2000 && this.year <= 2010); 

            // SOLUTION 1
            // to get around this problem , we can define self in parent function and use it
            // or we can use an arrow funciton
            console.log(self.year >= 2000 && self.year <= 2010);
            return self.year >= 2000 && self.year <= 2010;
        };
        console.log(`is he gen z : ${isGenZ()}`);

        // SOLUTION 2
        // as arrow functions do not have their own this keyword they uses their parent scope
        // this keyword
        const isMillenial = () => {
            console.log(this.year >= 1981 && this.year <= 1996);
            return this.year >= 1981 && this.year <= 1996;
        }
        console.log(`is he a Millenial : ${isMillenial()}`);
    },
    greet: () => console.log(`Hey ${this.firstName} ${this.alert}`),
    // here the this function is of global scope(window), as the arrow functions does not have its own this keyword
    // thus we can also access alert with this here 
    // therefore don't use arrow functions as methods.
};
nisarg.greet();

nisarg.calcAge();


// arguments keyword

const addExpr = function (a, b) {
    console.log(arguments);
    return a + b;
};
var addArrow = (a, b) => a + b; // arrow function does not get arguments keyword

addExpr(3, 4, 8, 9); // NOTE: you can pass more than defined arguments and access them using argument keyword
addArrow(4, 5);

