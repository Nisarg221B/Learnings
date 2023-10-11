const express = require('express');
const helmet = require('helmet');
const cookieSession = require('cookie-session');
var morgan = require('morgan')
const path = require('path');

const authRouter = require('./routes/authroutes/auth.router');
const secretRouter = require('./routes/afterlogin-routes/secret.router');

const config = {
    COOKIE_KEY_1: process.env.COOKIE_KEY_1,
    COOKIE_KEY_2: process.env.COOKIE_KEY_2,
};

const app = express();

app.use(helmet());
app.use(morgan('dev'))

app.use((req, res, next) => {
    console.log(req.session);
    next();
});

// registers a session stragety 
app.use(cookieSession({
    name: 'session',
    maxAge: 24 * 60 * 60 * 1000,
    // keys: ['secret key for rotation','secret key'],
    keys: [config.COOKIE_KEY_1, config.COOKIE_KEY_2]
}));

app.use((req, res, next) => {
    console.log(req.session);
    next();
});

app.use(express.static(path.join(__dirname, '..', 'public')));

app.use(authRouter);
app.use(secretRouter);

app.use((req, res, next) => {
    console.log(req.session);
    next();
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

module.exports = app;

