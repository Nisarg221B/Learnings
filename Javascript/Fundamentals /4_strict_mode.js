"use strict";
/*
Strict mode is declared by adding "use strict"; 
to the beginning of a script or a function.

Declared at the beginning of a script, it has global scope 
(all code in the script will execute in strict mode):

NOT allowed in strict mode
- Using a variable, without declaring it, is not allowed
- Using an object, without declaring it, is not allowed:
- Deleting a variable (or object) is not allowed.
- Deleting a function is not allowed.
- Duplicating a parameter name is not allowed.

https://www.w3schools.com/js/js_strict.asp

*/
// x = 12.4;
// console.log(x); // will give an error

let hasDriversLicence = false;
const passTest = true;

if(passTest) hasDriversLicence = true;
if(hasDriverLicence) console.log('I can drive :D'); // spelling mistakes


