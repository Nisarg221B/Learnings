const path = require('path');

const express = require('express');
const cors = require('cors');
const morgan = require('morgan');

const planetsRouter = require('./routes/planets/planets.router');
const launchsRouter = require('./routes/launches/launches.router');

const app = express(); // just a fancy listener function

// ******************************** CORS configuration  ***********************************

// var whitelist = ['http://localhost:3000'];

// var corsOptions = {
//     origin: function (origin, callback) {
//         if (whitelist.indexOf(origin) != -1) {
//             callback(null, true);
//         }
//         else {
//             callback(new Error('Not allowed by CORS'));
//         }
//     },
//     optionsSuccessStatus: 200,
// }

// ********************************** middlewares ****************************************

// **************** CORS ****************** 

app.use(cors({ origin: 'http://localhost:3000' })); 
// only necessary if the client is not on a different port (in this file) 
// or you want to allow a cross origin request from some other port

// **************** Logger - morgan ****************** 
// see readme for details

app.use(morgan('dev')); 

// **************** Body Parsing ****************** 

app.use(express.json());

// **************** hosting static files ****************** 

app.use(express.static(path.join(__dirname, '..', 'public')));

// **************** Routes ****************** 

app.use('/launches',launchsRouter); // lauches routes
app.use('/planets',planetsRouter); // planet routes

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'public', 'index.html'));
});

module.exports = app;
