// Inheritance Between "Classes": ES6 Classes

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

// extends links the prototypes behind the scenes
class StudentCl extends PersonCl{
    // construtor function
    constructor(fullName,birthyear,course){
        // this always need to happen first as it sets/overrides the "this" object
        super(fullName,birthyear); // behind the scene PersonCL.call(this,fullName,birthYear)
        
        // then you can add the StudenCL properties
        this.course = course
    }

    // Prototype methods
    introduce(){
        console.log(`\nHii! I am ${this._fullName}, I am studying ${this.course}`);
    }

    calcAge(){ // this method will shadow the calcAge of the parent class
        console.log(`I'm ${2023-this.age} but it feels like I am ${2023-this.age+10}\n`);
    }
}


const martha = new StudentCl('martha jones',22,'CSE');
martha.introduce();
martha.calcAge();

console.log(martha); // StudentCl
console.dir(martha.__proto__); // StudentCL.prototype 
console.dir(martha.__proto__.__proto__); // PersonCl.prototype
