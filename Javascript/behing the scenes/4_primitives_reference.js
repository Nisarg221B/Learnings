
// obsidian://open?vault=Documents&file=Technical%20Learning%2FJavaScript%2F6.%20Primitives%20and%20reference%20values

let lastName = 'patel';
let oldLastName = lastName;
lastName = 'Ravia';

console.log('\n',lastName,oldLastName,'\n');

const nisarg = {
    firstName: 'Nisarg',
    lastName: 'Patel',
    age:23,
};

const marriedNisarg = nisarg;
marriedNisarg.lastName = 'Ravia';
console.log('Before Marriage: ',nisarg);
console.log('After Marriage: ', marriedNisarg,'\n');



const nisarg2 = {
    firstName: 'Nisarg',
    lastName: 'Patel',
    age:23,
    Family: ['payal','harsha'],
};


// Copying Objects
// object.assign only creates a shallow copy, just the first level
const nisargShallowCopy = Object.assign({},nisarg2);

nisargShallowCopy.lastName = 'rathod';
console.log('Before : ',nisarg2);
console.log('After changing real copy : ', nisargShallowCopy,'\n');

console.log('-------After pushing a new family member------\n');

// In essence both nisarg2 and nisargShallowCOpy has a object call Family 
// which points to the same location in the heap
nisargShallowCopy.Family.push('Bhavesh');
console.log('Before : ',nisarg2);
console.log('After changing real copy : ', nisargShallowCopy,'\n');

// To create a deep clone
// we use external library for example lodash for such deep copying
