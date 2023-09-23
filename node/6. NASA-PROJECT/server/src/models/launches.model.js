const launches = new Map();

let latestFlightNumber = 100;

const launch = {
    flightNumber: 100,
    mission: 'Kepler Exploration X',
    rocket: 'Explorer IS1',
    launchDate: new Date('December 27,2030'),
    target: 'kepler-442 b',
    customer: ['ZTM', 'NASA'],
    upcoming: true,
    success: true,
};

launches.set(launch.flightNumber, launch);
// launches.get(100) === launch;

function getAllLaunches() {
    return Array.from(launches.values());
}

function existsLaunchWithId(launchId){
    return launches.has(launchId);
}

function addNewLaunch(launch) {
    latestFlightNumber += 1;
    launches.set(
        latestFlightNumber,
        Object.assign(launch, {
            flightNumber: latestFlightNumber,
            customer: ['ZTM', 'NASA'],
            upcoming: true,
            success: true,
        }),
    );
}

function abortLaunchById(launchId){
    const aborted = launches.get(launchId);
    aborted.upcoming = false;
    aborted.success = false;
    return aborted;
}

module.exports = {
    getAllLaunches,
    existsLaunchWithId,
    addNewLaunch,
    abortLaunchById, 
}