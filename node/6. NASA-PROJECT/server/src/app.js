const express = require('express');
const cors = require('cors');
const planetsRouter = require('./routes/planets/planets.router');

const app = express(); // just a fancy listener function

// ******************************** CORS configuration  ***********************************

var whitelist = ['http://localhost:3000', 'http://localhost:4000'];

var corsOptions = {
    origin: function (origin, callback) {
        if (whitelist.indexOf(origin) != -1) {
            callback(null, true);
        }
        else {
            callback(new Error('Not allowed by CORS'));
        }
    },
    optionsSuccessStatus: 200,
}

// ********************************** middlewares ****************************************

app.use(cors(corsOptions)); // 
app.use(express.json()); // body parsing
app.use(planetsRouter); // planet routes


module.exports = app;
