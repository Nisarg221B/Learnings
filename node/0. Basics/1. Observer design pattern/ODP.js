/*

Observer design pattern 
    obsidian://open?vault=Documents&file=Technical%20Learning%2FNode%2F4.%20Observer%20design%20pattern

    Much of the Node.js core API is build around asynchronous event-driven architecture 
    in which certain kinds of object(called = "emiiters") emit named events that cause
    Function objects("listners") to be called. 

    for ex : a net.Server object emits an event each time a peer connects to it; 
    a fs.ReadStream emits an event when the file is opened; a stream emits an event
    whenever data is available to be read.

    All objects that emit events are instances of the EventEmitter class. 
    These objects expose an eventEmitter.on() function that allows one or more functions
    to be attached to named events emitted by that object.

    when the EventEmitter object emits an event , all of the functions attached to that
    specific event are called synchronously. any values retured by the called listners
    are ignored and discarded.

    https://nodejs.org/api/events.html#asynchronous-vs-synchronous
*/

const EventEmitter = require('events');

const celebrity = new EventEmitter();


const observer1_supporter = function (result) {
    if(result){
        console.log(`observer1_supporter: Congrats!! you are the best , won by ${result+100} runs!! incredible`);
    }
    else{
        console.log('observer1_supporter: it happens , just a bad day , lets focus on future and practice!!')
    }
};

const observer2_supporter = function (result) {
    console.log(`observer2_supporter: Great blowing all out at ${result} is just awesome !!`);
};

const observer3_booer = function () {
    console.log('observer3_booer: Boo I could have done better than that!!');
}
const observer4_booer = function () {
    console.log('observer4_booer: well well !! ');
}
// celebrity.addListener() is an alias for celebrity.on

//  observer 1 subscribe to celebrity for both match win event and match loss event 
celebrity.on('match win', observer1_supporter)
celebrity.on('match loss', observer1_supporter)

// observer 2 subscribe to celebrity for match win event
celebrity.on('match win', observer2_supporter)
// observer 3 subscribe to celebrity for match loss event
celebrity.on('match loss',observer3_booer)
celebrity.on('match loss',observer3_booer) // the 3rd bro subscribed twice
// observer 4 subscribe to celebrity for match loss event 
celebrity.on('match loss',observer4_booer)



process.on('exit', (code) => {
    console.log('\nProcess exit event with code: ', code);
})


console.log(`\n **************** match won *****************\n`)
celebrity.emit('match win',50); // notifying the result also

console.log(`\n **************** match lost *****************\n`)
celebrity.emit('match loss'); // just notifying the event happend

console.log(`\n **************** match lost again and observer4 died *****************\n`)
celebrity.removeListener('match loss',observer4_booer); // alias for emitter.off 
celebrity.emit('match loss'); // just notifying the event happend
