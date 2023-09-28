const path = require('path');

const express = require('express');
const cors = require('cors');
const morgan = require('morgan');

const planetsRouter = require('./routes/planets/planets.router');
const launchsRouter = require('./routes/launches/launches.router');

const app = express(); // just a fancy listener function

// **************** Logger - morgan ****************** 
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
