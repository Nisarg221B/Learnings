//************************* 1. Importing modules **************************

// node-core module
const http = require('http');
const path = require('path');

// third-party production modules/dependencies 
const express = require('express');
const bodyParser = require('body-parser');
// const { engine } = require('express-handlebars');


// local modules
const adminData = require('./routes/admin');
const shopRoutes = require('./routes/shop');

const app = express();

//************************* 2. Specifying Template engines *************************


//*********** 2.1 PUG *************
// pug is supported by express out of the box so no need to import it externally
// app set allows us to set any configuration values globally on our express application
// which will let the express behave differently based on our configuration

// app.set(name, value); // Assigns setting name to value. You may store any value that you want, but certain names can be used to configure the behavior of the server. These special names are listed in the app settings table.
// app.set('view engine','pug'); // we are telling express - complie dynamic content with pug engine
// app.set('views','views/pugs'); // and where to find this templates (by default is location is view folder)



//*********** 2.2 Handlebar *************
/* 

// 1. to use non-default engine, we first need to register that engine using app.engine

//* app.engine(ext, callback)
//* egisters the given template engine callback as ext.

app.engine(
    'hbs', // this extention applies to all the files except layout
    engine({ // specifying the properties of the engine 
        extname: '.hbs', // this extention only applies to the layout
        layoutsDir: 'views/hbs_bar/layouts',
        defaultLayout: 'main-layout', // you can set it to false if you don't want to use default layout
    })
);

// you can retrieve whatever you set as setting using app.get(name);
// app.get('view engine') //* 'hbs'

app.set('view engine', 'hbs'); // then use the engine
app.set('views', 'views/hbs_bar'); // specifying the location 

*/

//*********** 2.3 EJS *************
// EJS is supported by express so no need to import it externally
// EJS do not support layouts

app.set('view engine','ejs');
app.set('views','views/ejs');


//************************* 3 utility Middlewares *************************


app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

//*********************** 4 Routes ***************************

app.use(adminData.routes);
app.use(shopRoutes);

app.use((req, res, next) => {
    res.status(404).render('404', { pageTitle: 'Page not found' });
});

//*********************** 5 Starting Server ***************************

app.listen(3000);
