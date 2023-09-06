
// basic
function logger(){}


// we can call function declarations before defining in the code, due to hoisting
const age1 = calcAge1(1991);
console.log(age1);


// function declaration
function calcAge1(birthyear){
    return 2037 - birthyear;
}


// but we cannot call function expression for assigning it
// const age2 = calcAge2(1991); // error 

// Function expression 
const calcAge2 = function(birthyear){
    return 2037-birthyear;
}

const age2 = calcAge2(1991);
console.log(age2);


// Arrow functions
const calcAge3 = birthyeah => 2037 - birthyeah;
const calcAge4 = (birthyeah) => {
    return 2037 - birthyeah;
}
const age3 = calcAge3(1991);
console.log(age3)