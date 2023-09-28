const launchesMongo = require('./launches.mongo');
const planets = require('./planets.mongo'); // for maintaining refrential integrity

const DEFAULT_FLIGHT_NUMBER = 100;

async function getLatestFlightNumber() {
    const latestLaunch = await launchesMongo
        .findOne()
        .sort('-flightNumber'); // sorting in descending order -

    if (!latestLaunch) {
        return DEFAULT_FLIGHT_NUMBER;
    }
    return latestLaunch.flightNumber;
}

async function getAllLaunches() {
    // return Array.from(launches.values());
    return await launchesMongo.find({}, {
        '_id': 0,
        '__v': 0,
    });
}

async function saveLaunch(launch) {
    try {
        const planet = await planets.findOne({ // for referential integrity
            keplerName: launch.target,
        });
        if (!planet) { // for referential integrity
            throw new Error('No matching planet found');
        }
        // findOne also returns a new property named "$setonInsert" if the 
        // object is not already present
        // thus use findOneAndUpdate which only returns the properties we set in our update 
        await launchesMongo.findOneAndUpdate({
            flightNumber: launch.flightNumber,
        }, launch, {
            upsert: true,
        });
    } catch (err) {
        throw err;
    }
}

async function existsLaunchWithId(launchId) {
    return await launchesMongo.findOne({
        flightNumber: launchId,
    });
}

async function scheduleNewLaunch(launch) {
    try {
        const newFlightNumber = await getLatestFlightNumber() + 1;

        const newLaunch = Object.assign(launch, {
            flightNumber: newFlightNumber,
            success: true,
            upcoming: true,
            customers: ['ZTM', 'NASA'],
        });
        await saveLaunch(newLaunch);
    } catch (err) {
        throw err;
    }
}

async function abortLaunchById(launchId) {
    const aborted =  await launchesMongo.updateOne({
        flightNumber:launchId,
    },{
        upcoming:false,
        success:false,
    }); // no need to pass upsert as we know that document do exist 
    console.log(aborted);
    return (aborted.acknowledged === true && aborted.modifiedCount === 1);
}

module.exports = {
    getAllLaunches,
    existsLaunchWithId,
    scheduleNewLaunch,
    abortLaunchById,
}