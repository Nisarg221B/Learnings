const http = require('http');

const { mongoConnect } = require('./services/mongo');
const app = require('./app'); // seperating the express code 
const { loadPlanetsData } = require('./models/planets.model');

require('dotenv').config(); // configuring env

const PORT = process.env.PORT || 8000;

const server = http.createServer(app);


async function startServer(){
    await mongoConnect();
    await loadPlanetsData(); 

    // starting the server 
    server.listen(PORT,()=>{
        console.log(`listening on port ${PORT}...`);
    })
};

startServer();
