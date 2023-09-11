
/*

Javascript is a high level, prototype based object oriented, multi paradigm,
interpreted or just in time complied, dynamic(dynamically typed), single threaded, garbage collected
programming language wiith first class functionis and a non-blocking event loop
concurrency model.

obsidian://open?vault=Documents&file=Technical%20Learning%2FJavaScript%2FInternals

*/

// Scoping and Scope chain
// obsidian://open?vault=Documents&file=Technical%20Learning%2FJavaScript%2F3.%20%20Scope%20and%20the%20Scope%20Chain

'use strict';


function calcAge(birthYear){
    const age = 2023 - birthYear;
    console.log(firstName); // will print , as its in a global scope

    function printAge(){
        const output =  `you are ${age}, born in ${birthYear}`;
        console.log(output);

        if(birthYear >= 2000 && birthYear <= 2010){
            var millenial = false; // has a function scope 
            const str = `oh, and you're a gen z, ${firstName}`; // const and let have a block scope
            console.log(str);

            function add(a,b){ return a+b}; 
            // function declarations has block scope in strict mode and function scope otherwise
        }
        // console.log(str); // will produce error as str has block scope
        console.log(millenial);
        
        // let result = add(2,3); // will produce error in strict mode
        // console.log(result);
    }
    printAge();
    return age;
}

const firstName = 'nisarg';
calcAge(2000);
