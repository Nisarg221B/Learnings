// obsidian://open?vault=Documents&file=Technical%20Learning%2FJavaScript%2F4.%20Hoisting

console.log("-----------Vaiables------------\n");
// TDZ starts for job and year

console.log(me); // undefined
// console.log(job); // error (Cannot access 'job' before initialization)
// console.log(year); // error (Cannot access 'year' before initialization)
// console.log(age); // error (Cannot access 'age' before initialization)

var me = 'nisarg';

// TDZ ends for job and year
let job = 'developer';
const year = 2023;
let age;

console.log(age); // undefined


console.log("-----------functions------------\n")
//Functions

console.log(addDecl(3,4));
// console.log(addArrow(3,4)); // Error , Cannot access 'addArrow' before initialization
// console.log(addExprConst(3,3)); // Error, Cannot access 'addExprConst' before initialization
// console.log(addExprVar(3,5)); // Error, addExprVar is not a function


function addDecl(a,b){
    return a+b;
}

const addExprConst = function(a,b){
    return a+b;
};

var addExprVar = function(a,b){
    return a+b;
};

const addArrow = (a,b) => a+b;
