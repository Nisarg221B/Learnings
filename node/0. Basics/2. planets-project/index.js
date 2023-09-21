const { parse } = require('csv-parse');
const fs = require('fs');

const HabitablePlanets = [];

function isHabitablePlanet(planet) {
    return planet['koi_disposition'] === "CONFIRMED"
        && planet['koi_insol'] > 0.36 && planet['koi_insol'] < 1.11
        && planet['koi_prad'] < 1.6;
}

// Its important to understand that this all event driven code is normal synchronous code
// see observer design pattern
// don't get it confused with promises or asyn code just because they have callback functions
// however 
// createReadStream returns a stream which adds all this events synchronously , but the
// functions which invokes this events inside the stream are async.
// ex: fs.open() function opens the file asynchronously and emits the "open" event
// and thus this callbacks are invoked or called at the time of event asynchronously
// but the createReadStream itself is synchronous function. 
// [read this](https://stackoverflow.com/questions/30386768/is-createreadstream-asynchronous)

keplerStream = fs.createReadStream('kepler_data.csv')
    .on('open', () => {
        console.log("file kepler_data.csv opened for read");
    })
    .pipe(parse({
        comment: '#',
        columns: true,
    }))
    .on('data', (chunk) => {
        if (isHabitablePlanet(chunk))
            HabitablePlanets.push(chunk);
    }).on('error', (err) => {
        console.log(err.message);
    }).on('end', () => {
        console.log(`first ending`)
    }).on('end', () => {
        console.log('Habitable planets : \n', HabitablePlanets.map((planet) => { return planet.kepler_name }));
        console.log('total : ', HabitablePlanets.length);
    });

// this will print first as the events are already added 
console.log(keplerStream.listenerCount('data')); // 1
console.log(keplerStream.listenerCount('end')); // 2