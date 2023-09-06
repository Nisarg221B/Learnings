
// Array declarations 
const friends = ['nisarg','payal','nikhil'];
console.log(friends);

const years = new Array(2000,2012,2023,2025);
console.log(years);


// Operations 

friends.push('nishant'); // add at end
console.log(friends);

friends.pop(); // removes last
console.log(friends);

friends.shift(); // removes first
console.log(friends);

friends.unshift('nishant'); // add at front
console.log(friends);

console.log(friends.indexOf('payal'));

console.log(friends.includes('payal')); // checks for avability , using strict equality
console.log(friends.includes('payool'));

friends.push(2);
console.log(friends.includes('2')); // false , as includes uses strict equality
console.log(friends.includes(2)); // true

