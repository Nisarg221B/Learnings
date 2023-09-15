//************************* Importing modules **************************

// node-core module
const path = require('path');

// third-party production modules/dependencies 
const express = require('express');
const bodyParser = require('body-parser');

// local modules
const adminRoutes = require('./routes/admin');
const shopRoutes = require('./routes/shop');
const errorController = require('./controllers/errors');

const app = express();

//************************* Specifying Template engines *************************

app.set('view engine','pug'); 

//************************* utility Middlewares *************************


app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

//*********************** Routes ***************************

app.use('/admin',adminRoutes);
app.use(shopRoutes);
app.use(errorController.pageNotFoundErrorPage);

//*********************** Starting Server ***************************

app.listen(3000);
