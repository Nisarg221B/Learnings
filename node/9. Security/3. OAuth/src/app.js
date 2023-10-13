const express = require('express');
const helmet = require('helmet');
var morgan = require('morgan')
const path = require('path');

const authRouter = require('./routes/authroutes/auth.router');
const secretRouter = require('./routes/afterlogin-routes/secret.router');

const app = express();

app.use(helmet());
app.use(morgan('dev'));

app.use(authRouter);
app.use('/secret', secretRouter);


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'public', 'index.html'));
});

module.exports = app;

