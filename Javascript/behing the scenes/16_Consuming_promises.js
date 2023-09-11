// What are Promises

// An object that is used as a placeholder for the future result of an
// asynchronous operation.

// const request = fetch("https://restcountries.com/v3.1/name/portugal");
// console.log(request); // Promise object (but not fulfilled)
// setTimeout(() => {
//   console.log(request); // Promise object fulfilled , thus its a response for the request
// }, 5000);

console.log("\n<------------ Consuming promises ------------>\n");

const getCountryData = function (country) {
  fetch(`https://restcountries.com/v3.1/name/${country}`)
    .then(function (resposne) {
      // if the request was successful
      // console.log(resposne);
      // console.log(resposne);
      if (!resposne.ok) {
        // handling 404 error
        throw new Error(`Country not found ${resposne.status}`);
      }
      return resposne.json();
      // this json function is also a asynchronous function thus it also returns a promise
    })
    .then(function (data) {
      console.log(data);
    })
    .catch((err) => {
      console.log(err.message);
    })
    .finally(() => {
      // will always run no matter the result of promise
    });
};

// getCountryData("United Kingdom");
getCountryData("hghjkjbnoikno");

console.log("\n<------------ Event loop demo ------------>\n");
// Microtask queue has priority over callback queue

console.log("Test Start");

setTimeout(() => console.log("0 sec timer"), 0); // in callback queue

Promise.resolve("Resolved Promise 1").then((res) => console.log(res)); // in microtask queue

Promise.resolve("Resolved Promise 2").then(function (res) {
  for (let i = 0; i < 1000000000; i++) {}
  console.log(res);
}); // in microtask queue

console.log("Test End");
