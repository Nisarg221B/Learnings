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
        await launchesMongo.updateOne({
            flightNumber: launch.flightNumber,
        }, launch, {
            upsert: true,
        });
    } catch (err) {
        throw err;
    }
}

function existsLaunchWithId(launchId) {
    return launches.has(launchId);
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

function abortLaunchById(launchId) {
    const aborted = launches.get(launchId);
    aborted.upcoming = false;
    aborted.success = false;
    return aborted;
}

module.exports = {
    getAllLaunches,
    existsLaunchWithId,
    scheduleNewLaunch,
    abortLaunchById,
}