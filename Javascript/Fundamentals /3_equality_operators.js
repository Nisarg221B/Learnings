// == vs ===


// ===  , strict equality operator , only returns true if the operands are really equal
// implies does not perform type coersion

// == , loos equality operator => performs type coersion.

const age = 18;
if(age === 18) console.log('=== 18',age);
if(age === '18') console.log("=== '18'",age);

if(age == 18) console.log('==',age);  
if(age == '18') console.log('==',age);  

// const fav = prompt("what's your fav number?");
// console.log(fav);
// console.log(typeof fav);

if(age !== 23) console.log('why not 23?');
if(age != '18') console.log('why not 18?, !=');
if(age !== '18') console.log('why not 18?, !==');