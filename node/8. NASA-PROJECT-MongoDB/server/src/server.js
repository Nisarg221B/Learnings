const http = require('http');

const mongoose = require('mongoose');
const app = require('./app'); // seperating the express code 
require('dotenv').config(); // configuring env

const { loadPlanetsData } = require('./models/planets.model');

const PORT = process.env.PORT || 8000;
const MONGO_PASS = process.env.MONGO_PASS
const databaseName = 'nasa'
const MONGO_URL = `mongodb+srv://nasa-api:${MONGO_PASS}@nasacluster.elia6pz.mongodb.net/${databaseName}?retryWrites=true&w=majority`

const server = http.createServer(app);


async function startServer(){

    mongoose.connection.on('open',()=>{ // mongoose.connection is an event emmiter
        console.log('MongoDB connection ready!');
    })
    .on('error', (err)=>{
        console.log('here');
        console.log(err.message);
    });
    
    await mongoose.connect(MONGO_URL); // connecting mongo db atlas 
    await loadPlanetsData(); 

    // starting the server 
    server.listen(PORT,()=>{
        console.log(`listening on port ${PORT}...`);
    })
};

startServer();
