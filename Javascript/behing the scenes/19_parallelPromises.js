/*
INDEX
 1. running paralled promises synchronously
 2. running paralled promises Asynchronously
        - Promise.all()
         // returns array of all the promises which gets resolved 
            ( it shortcircuits if any of the promise gets rejected).

        - Promise.allSettled() 
        // always returns array of all the promises which get settled 
            (rejected or resolved doesn't matter)

        - Promise.race() // returns the first promise to get settled
        - Promise.any() // returns the first promise to get resolved 
*/


async function getJson(country) {
  const res = await fetch(`https://restcountries.com/v3.1/name/${country}`);
  if (!res.ok) throw new Error("Country name not listed!!");
  // console.log(res);
  const data = await res.json();
  return data[0];
}

const get3CountriesSync = async function (c1, c2, c3) {
  // <------------ RUNNING PROMISES SYNCHRONOUSLY ------------>
  try {
    const data1 = await getJson(c1);

    // this will run after the data1 is fetched
    const data2 = await getJson(c2);

    // this will run after the data2 is fetched
    const data3 = await getJson(c3);

    // thus synchronous
    console.log("Got data sync one by one: ", [
      data1.capital,
      data2.capital,
      data3.capital,
    ]);
  } catch (err) {
    console.error(err);
  }
};

get3CountriesSync("portugal", "canada", "tanzania");

// <------------ PROMISE COMBINATORS - Promise.all() ------------>


const get3CountriesAsync = async function (c1, c2, c3) {

  try {
    // helper function on promise construtor , a static method, this function
    // takes an array of promises and it will return a new promise,
    // which will then run all the promises in the array at the same time.
    const data = await Promise.all([getJson(c1), getJson(c2), getJson(c3)]);

    // Promise.all will shortcircuit as soon as one promise rejects 
    // Promise.allSettled simply never short circuit
    console.log(
      "Got data async promise.all : ",
      data.map((d) => d.capital)
    );
  } catch (err) {
    console.error(err);
  }
};

get3CountriesAsync("portugal", "canada", "tanzania");


// <------------ PROMISE COMBINATORS - Promice.allsettled ------------>

/*
just like Promise.all it takes an array of promises and returns a Promise that is 
resolved with an array of results when all of the provided Promises resolve or reject.

just the difference is that 

Promise.all will shortcircuit as soon as one promise rejects 
Promise.allSettled simply never short circuit , it returns all the results, resolve or reject.

*/

Promise.allSettled([
    getJson("italy"), // Promise.resolve()
    getJson("mexico"), 
    getJson("fds"), // Promise.reject()
    getJson("portugal"),
]).then((data)=>{
    console.log(
        "Got data async Promise.allSettled : ",
        data.map((d) => d.value?.name.common)
      );
});

// <------------ PROMISE COMBINATORS - Promice.race ------------>

(async function (c1, c2, c3) {
  /*
    Creates a Promise that is resolved or rejected when any of the provided 
    Promises are settled (resolved or rejected).
    
    thus  the Promise.race returns a single value, whichever was fastest to get settled.

    you can say that Promise.race gets shortcircuited whenever any of the promise provide
    gets settled (doesn't matter if it was reject or resolved)
    */
  const res = await Promise.race([getJson(c1), getJson(c2), getJson(c3)]);
  console.log('Promise.race : ',res.name["common"]);
})("italy", "egypt", "mexico");

const timeout = function (sec) {
  return new Promise(function (_, reject) {
    setTimeout(function () {
      reject(new Error("Request took too long!"));
    }, sec * 1000);
  });
};

// we can use Promice.race to implement a timeout
//  to prevent against never ending promises, or very long running promises.

Promise.race([getJson("italy"), timeout(5)])
  .then((res) => console.log("timeout: ", res.name.common))
  .catch((err) => console.log('err : ' ,err.message));

  // <------------ PROMISE COMBINATORS - Promice.any ------------>


(async function (c1, c2, c3,c4) {
    /*
      Creates a Promise that is resolved when any of the provided 
      Promises is resolved. unlike race which returns resolved or rejected, 
      promise.any always returns a resolved promise. 
      */
    const res = await Promise.any([getJson(c1), getJson(c2), getJson(c3),getJson(c4)]);
    console.log('Promise.any : ',res.name["common"]);
  })("italy", "egypt", "mexico","fdsfs");





