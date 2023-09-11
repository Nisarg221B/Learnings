// obsidian://open?vault=Documents&file=Technical%20Learning%2FJavaScript%2F7.%20%20Functions

const secureBooking = function(){
    let passengerCount = 0;

    return function(){
        passengerCount++;
        console.log(`${passengerCount} passengers`);
    };
};

const booker = secureBooking();

booker();
booker();
booker();



// example 2

let f;

const g = function (){
    let a = 42;
    f = function(){
        console.log(a*3); // 21*3 -> 63
    };
    a = a/2; // 21
};

g();
f();


