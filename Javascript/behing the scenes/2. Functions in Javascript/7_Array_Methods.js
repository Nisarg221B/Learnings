/*

INDEX

- Array methods
- slice
- splice
- reverse
- concat
- join
- at
- Data Transformations : MAP, Filter , Reduce
- Method chaining
- find and findIndex method
- includes, some and every
- Sorting arrays

obsidian://open?vault=Documents&file=Technical%20Learning%2FJavaScript%2F8.%20Array%20Methods

*/

let arr = ["a", "b", "c", "d", "e"];

// Slice
console.log("\n---------- Slice ---------\n");

// Returns a copy of a section of an array. For both start and end,
// a negative index can be used to indicate an offset from the end of the array.
// For example, -2 refers to the second to last element of the array.

// starting index , end index
console.log(arr.slice(2));
console.log(arr.slice(2, 4));
console.log(arr.slice(-1));
console.log(arr.slice(-3));
console.log(["z", ...arr]);

// splice
console.log("\n---------- Splice ---------\n");
// Removes elements from an array and, if necessary,
// inserts new elements in their place, returning the deleted elements.

// starting index , deleteCount
arr.splice(1, 2); // mutates the original array
console.log(arr);
arr.splice(0, 2);
console.log(arr);

// reverse
console.log("\n---------- Reverse ---------\n");
arr = ["a", "b", "c", "d", "e"];
// reverse also mutates the orginial array

const arr2 = ["h", "i", "j", "k", "l"];
arr2.reverse();
console.log(arr2);

// Concat
console.log("\n---------- Concat ---------\n");
// deos not mutate original array

const letters = arr.concat(arr2);
console.log(letters);
console.log([...arr, ...arr2]); // you can also use spread operator

// Join
console.log("\n---------- Join ---------\n");
console.log(letters.join(" - "));

// At method
console.log("\n---------- at method ---------\n");

arr = [22, 11, 45];
console.log(arr[0]);
console.log(arr.at(0));

// traditional way of getting last element
console.log(arr[arr.length - 1]);
console.log(arr.slice(-1)[0]);

// using at method
console.log(arr.at(-1));

// Data Transformations
console.log("\n---------- Data Transformations - MAP ---------\n");

const movements = [200, 450, -400, 3000, -650, -130, 70, 1300];

const eurToUsd = 1.1;

const movementsUSD = movements.map(function (val) {
  return val * 1.1;
});

console.log("movements: ", movements);
console.log("movements in USD: ", movementsUSD);

const movementsDescriptions = movements.map(
  (mov, index) =>
    `Movement ${index + 1} : You ${
      mov > 0 ? "deposited" : "widthdrew"
    } ${Math.abs(mov)}`
);

console.log("movement Description: ", movementsDescriptions);

console.log("\n---------- Data Transformations - Filter ---------\n");

const deposits = movements.filter(function (mov) {
  return mov > 0;
});

console.log("movements: ", movements);
console.log("deposits : ", deposits);

console.log("\n---------- Data Transformations - Reduce ---------\n");

console.log("movements: ", movements);

const balance = movements.reduce(function (
  prev_value,
  cur_value,
  curr_index,
  arr
) {
  return prev_value + cur_value;
},
0); // 0 -> initial value of accumulator or prev_value

console.log("balance: ", balance);

console.log("\n---------- Method chaining ---------\n");

const totalDepositsInUSD = movements
  .filter((mov) => mov > 0)
  .map((mov) => mov * eurToUsd)
  .reduce((acc, mov) => acc + mov, 0);

console.log(totalDepositsInUSD);


console.log("\n---------- Find and findIndex Method ---------\n");


console.log(movements);
// First withdrawal 
console.log("First withdrawal: ",movements.find(mov => mov<0)); // returns the first element which satisties the condition of callback function
console.log("at Index        : ",movements.findIndex(mov => mov<0));


console.log("\n---------- some and every Method ---------\n");

// [200, 450, -400, 3000, -650, -130, 70, 1300];

const deposit = mov => mov > 0;

// includes checks for EQUALITY
console.log(movements.includes(200));

// some checks if ANY element satisfies the given CONDITION
console.log(movements.some(mov => mov > 500));
console.log(movements.some(deposit)); // checking if the movements contains any deposit or not

// EVERY only returns true of all of the elements satisfies the give CONDITION
console.log(movements.every(deposit)); // checking that all the elements in movements are deposit



console.log("\n---------- sorting arrays ---------\n");

const owners = ['nisarg','payal','harsha','bhavesh','akshar','nikhil'];
owners.sort();
console.log(owners);

owners.sort((a,b)=>{
  if(a<b)
    return 1;
  else
    return -1;
}); // sorting in descending order

console.log(owners);
