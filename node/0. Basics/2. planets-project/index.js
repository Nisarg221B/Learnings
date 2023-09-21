const { parse } = require('csv-parse');
const fs = require('fs');

const HabitablePlanets = [];

function isHabitablePlanet(planet){
    return planet['koi_disposition'] === "CONFIRMED"
        && planet['koi_insol'] > 0.36 && planet['koi_insol'] < 1.11
        && planet['koi_prad'] < 1.6;
}

// its important to understand that this all event driven code is synchronous
// see observer design pattern
// don't get it confused with promises or asyn code just because they have callback functions
keplerStream = fs.createReadStream('kepler_data.csv').pipe(parse({
    comment: '#',
    columns: true,
})).on('data', (chunk) => {
    if(isHabitablePlanet(chunk))
        HabitablePlanets.push(chunk);
}).on('error', (err) => {
    console.log(err.message);
}).on('end',()=>{
    console.log(`first ending`)
}).on('end', () => {
    console.log('Habitable planets : \n',HabitablePlanets.map((planet)=>{return planet.kepler_name}));
    console.log('total : ',HabitablePlanets.length);
});

// console.log(keplerStream.listenerCount('data')); // 1
// console.log(keplerStream.listenerCount('end')); // 2