//************************* Importing modules **************************

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

//************************* Specifying Template engines *************************


//*********** PUG *************
// pug is supported by express so no need to import it externally
// app set allows us to set any configuration values globally on our express application
// which will let the express behave differently based on our configuration
// app.set('view engine','pug'); // we are telling express - complie dynamic content with pug engine
// app.set('views','views/pugs'); // and where to find this templates (by default is location is view folder)



//*********** Handlebar *************
// to use non-default engine, we first need to register that engine 
// app.engine(
//     'hbs', // applies to all the files except layout
//     engine({
//         extname: '.hbs', // only applies to layout
//         layoutsDir: 'views/hbs_bar/layouts',
//         defaultLayout: 'main-layout', // you can set it to false if you don't want to use default layout
//     })
// );

// app.set('view engine', 'hbs'); // then use the engine
// app.set('views', 'views/hbs_bar'); // specifying the location 



//*********** EJS *************
// EJS is supported by express so no need to import it externally
// EJS do not support layouts

app.set('view engine','ejs');
app.set('views','views/ejs');


//************************* utility Middlewares *************************


app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

//*********************** Routes ***************************

app.use(adminData.routes);
app.use(shopRoutes);

app.use((req, res, next) => {
    res.status(404).render('404', { pageTitle: 'Page not found' });
});

//*********************** Starting Server ***************************

app.listen(3000);
