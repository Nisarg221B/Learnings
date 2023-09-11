
// Type conversion (Manual)

const inputYear = '1991';

// String to number
console.log(Number(inputYear),inputYear);
console.log(Number(inputYear) + 18);


console.log(typeof NaN); // NaN is a number ,but a invalid one

// thus below returns NaN
console.log(Number('nisarg'));

// number to string 
console.log(String(23));


// Type Coercion 

// + operator triggers a coercion to strings 
console.log('I am ' + 23 + ' years old');
console.log('23' + '10' + 3);

// - operator triggers a coercion to numbers
console.log('23' - '10' - 3);

console.log('23' * 2);
console.log('23' * '2');

