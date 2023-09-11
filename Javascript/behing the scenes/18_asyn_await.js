// async - await is syntackting sugar over "then"

const whereAmI = async function (country) {
  // fetch(`https://restcountries.com/v3.1/name/${country}`).then(res => console.log(res))
  try {
    const res = await fetch(`https://restcountries.com/v3.1/name/${country}`);
    if (!res.ok) throw new Error("Country name not listed!!");

    // console.log(res);
    const data = await res.json();
    // console.log(data);

    return `you are in ${data[0].name.common}`;
    // above will become fullfield value of this promise
  } catch (err) {
    // console.log(err.message);
    // Reject promise returned from async function
    throw err;
  }
};

console.log("1. will get country data");

// const city = whereAmI("portugal");
// console.log(city);

// we need to use then method as await can only be used inside a async function for now
whereAmI("fdsf")
  .then((country) => console.log(`2: ${country}`))
  .catch((err) => console.error(`2. ${err.message}`))
  .finally(() => console.log("3. Finished getting country data "));

// console.log("3. done ");

(async function () {
  try {
    const country = await whereAmI("portugal");
    console.log(country);
  } catch(err){
    console.err(`${err.message}`)
  }
})();
