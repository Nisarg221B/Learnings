// Building promise
const lotteryPromise = new Promise(function (resolve, reject) {
  console.log("Lotter draw is happening.....");
  setTimeout(function () {
    if (Math.random() >= 0.5) {
      resolve("You Won the lottery!");
    } else { 
      reject(new Error("Sorry! You lost"));
    }
  }, 2000);
});

// consuming promise

lotteryPromise
  .then((response) => console.log(response))
  .catch((err) => console.log(err.message));

// Promisifying - wrapping old callback based functions into promises
// means to convert callback based asynchronous behaviour to promise based.

// Promisifying setTimeout function and create a wait function

const wait = function (seconds) {
  return new Promise(function (resolve) {
    setTimeout(()=>{
        resolve(`waited for ${seconds}`)
    }, seconds*1000);
  });
};

wait(4).then((message)=>{
    console.log(message);
})

