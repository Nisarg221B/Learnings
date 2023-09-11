// Encapsulation 

// 1) Private Methods
// 2) Public Methods 
// 3) Private Field
// 4) Public Field 
console.log("\n<------------ Encapsulation ------------>\n");

class Account{
    // public fields 
    currency;

    // private fields 
    #movements = [];
    #pin;

    // constructor function
    constructor(owner,currency,pin){
        this.owner = owner; // instance property not a field 

        this.currency = currency; // setting the "public field" 
        this.#pin = pin; // "private field" (truely)

        // protected property ( just a convention , not real encapsulation )
        // this._movements = [];
        
        console.log(`thanks for opening an accout, ${this.owner}`);
    }

    // prototype methods

    // Public methods
    get Movements(){
        return this.#movements;
    }

    // Public interface of our objects (APIs)
    deposite(val){
        this.#movements.push(val);
        console.log(`${(val<0) ?'deposited':'withdrawen'} ${val}`);
        return this;
    };

    withdraw(val){
        this.deposite(-val);
        return this;
    };

    requestLoan(val){
        if(this.#approveLoan(val)){
            console.log(`loan of ${val} approved for ${this.owner}`);
            this.deposite(val);
        }
        return this;
    };

    // Private Methods 
    #approveLoan(val){
        return true;
    };
}

const acc1 = new Account(`nisarg`,`EUR`,1111);
console.dir(acc1);

// acc1.movements.push(250);
// acc1.movements.push(-129); // this should be not allowed
acc1.deposite(250);
acc1.withdraw(129);

acc1.requestLoan(1000);
// acc1.approveLoan(1000); // this is internal method and thus should not be allowe outside the class 

console.log('\nMovements: ',acc1.Movements,'\n');

console.log(acc1);


console.log("\n<------------ Method chaining ------------>\n");


acc1.deposite(200).deposite(500).withdraw(35).requestLoan(2500).withdraw(4000);