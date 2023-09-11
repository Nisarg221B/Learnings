// async matlab saare kaam ek saath shuru kardo, jiska answer pehle aajaye uska jawaad dedean

/*

task a - 5
task b - 2
task c - 15
task d - 1

in async way - d, b, a, c
*/

console.log("hey1");
console.log("hey2");
setTimeout(function () {
  console.log("hey3");
}, 0);
console.log("hey4");

var ans = new Promise((res, rej) => {
  var n = Math.floor(Math.random() * 10);

  if (n < 5) {
    return res();
  } else {
    return rej();
  }
});

ans
  .then(function () {
    console.log("below");
  })
  .catch(function () {
    console.log("above");
  });

// Promise chaining
var ans2 = new Promise((res, rej) => {
  return res("1. sabse pehle ghar par aao");
});

let ans3 = ans2.then(function (data) {
  console.log(data);
  return new Promise(function (res, rej) {
    return res("2. gate kholo andar jao aur gate lagao");
  });
});

let ans4 = ans3.then(function (data) {
  console.log(data);
  return new Promise(function (res, rej) {
    return res("3. khana pakao khaana khaao");
  });
});

let ans5 = ans4.then(function (data) {
  console.log(data);
  return new Promise(function (res, rej) {
    return res("4. sojao");
  });
});

ans5.then(function (data) {
  console.log(data);
});

// using then
function abcd() {
  fetch(`https://randomuser.me/api/`)
    .then(function (raw) {
      return raw.json();
    })
    .then(function (data) {
      console.log(data);
    });
}

// using async - await
async function abcde(){
  let raw = await fetch(`https://randomuser.me/api/`);
  let ans = await raw.json();
  // moving both the above line to side stack
  console.log(ans);
}

abcde();
abcd();
