const http = require('http');

const app = require('./app'); // seperating the express code 
const { loadPlanetsData } = require('./models/planets.model');

const PORT = process.env.PORT || 8000;
// see package.json "start" node to see env variable PORT=5000
// we can also receive arguments using process.arg

const server = http.createServer(app);

async function startServer(){
    /*
    * awaiting the services to get loaded before the server starts 
    * Example 
        ** loading the data
        ** await the loading of database to get completed
    */
    await loadPlanetsData(); 

    // starting the server 
    server.listen(PORT,()=>{
        console.log(`listening on port ${PORT}...`);
    })
};

startServer();
