/*
# 2. ES6 Classes
- Modern alternative to constructor function syntax;
- "Syntactic sugar": behind the scenes, ES6 classes work **exactly** like constructor functions;
- ES6 classes do NOT behave like classes in "classical OOP".

# 3. Object.create()
*/

// in javascript the classes are also special type of functions
// just sugarcoated for easier use and understanding

console.log("\n<------------ ES6 classes ------------>\n");

// class expression
// const PersonCl = class {}

// class declaration
class PersonCl{
    constructor(fullName,birthyear){
        this.fullName = fullName;
        this.birthyear = birthyear;
    }
    // All of the methods which we write inthe class outside of the constructor method
    // will be in the prototype of the object.
    calcAge(){
        console.log(2023 - this.birthyear);
    }

    // getter
    get age(){
        return 2023 - this.birthyear;
    }
    
    // setter (also usefull for validation like this )
    set fullName(name){
        if(name.includes(' ')) this._fullName = name;
        else console.error(`ERROR : ${name} is not a full name! , not setting the name `);
    }

    static hey(){
        console.log('Hey there!');
        console.log(this);
    }
}

PersonCl.prototype.greet =function(){
    console.log(`Hey ${this.firstname}`);
};

const nikshan = new PersonCl('nikshan','2002'); // setter will throw an console error
console.log('Nikshan: ',nikshan,'\n');


const nikhil = new PersonCl('Nikhil Gupta','2001');
console.log(nikhil);
console.log(nikhil.__proto__);
console.log(nikhil.__proto__ == PersonCl.prototype);

console.log('getting age: ',nikhil.age); // getter
nikhil.calcAge();
nikhil.greet();

// 1. Classes are NOT hoisted
// 2. Classes are first-class ( as they are internally functions)
// 3. Classses are executed in strict mode.

console.log("\n<------------ Getters and Setters ------------>\n");

const account = {
    owner: 'Jonas',
    movements: [200,350,120,340],

    get latest(){
        return this.movements.slice(-1).pop();
    },

    set latest(mov){
        this.movements.push(mov);
    },
};

console.log(account.movements);
console.log(account.latest); // invoking getter
account.latest = 30; // invoking setter
console.log(account.movements);


console.log("\n<------------ Static Methods ------------>\n");

PersonCl.hey();