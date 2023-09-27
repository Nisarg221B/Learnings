const { parse } = require('csv-parse');
const fs = require('fs');
fs.promises.createReadStream

const path = require('path');

const habitablePlanets = [];

function isHabitablePlanet(planet) {
    return planet['koi_disposition'] === "CONFIRMED"
        && planet['koi_insol'] > 0.36 && planet['koi_insol'] < 1.11
        && planet['koi_prad'] < 1.6;
}

/*
-------------------------------------------------
const promise = new Promise((resolve,reject) => {
    resolve(42); // result =42
});
-------------------------------------------------
promise.then((result) => {

});
or
const result = await promise;
*/

function loadPlanetsData() {
    return new Promise((resolve, reject) => {
        fs.createReadStream(path.join(__dirname,'..','..','data','kepler_data.csv'))
            .pipe(parse({
                comment: '#',
                columns: true,
            }))
            .on('data', (chunk) => {
                if (isHabitablePlanet(chunk)) {
                    habitablePlanets.push(chunk);
                }
            })
            .on('error', (err) => {
                console.log(err.message);
                reject(err);
            })
            .on('end', () => {
                //console.log('Habitable planets : \n', habitablePlanets.map((planet) => { return planet.kepler_name }));
                //console.log('total : ', habitablePlanets.length);
                resolve(habitablePlanets);
            });
    });
}

function getAllPlanets(){
    return habitablePlanets;
} 

module.exports = {
    getAllPlanets,
    loadPlanetsData,
}

