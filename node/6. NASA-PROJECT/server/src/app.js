const path = require('path');

const express = require('express');
const cors = require('cors');
const planetsRouter = require('./routes/planets/planets.router');

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

app.use(cors({ origin: 'http://localhost:3000' })); // 
app.use(express.json()); // body parsing

app.use(express.static(path.join(__dirname, '..', 'public')));

app.use(planetsRouter); // planet routes

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'public', 'index.html'));
});

module.exports = app;
