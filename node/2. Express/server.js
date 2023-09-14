//************************* 1. Importing modules **************************

// node-core module
const http = require('http');
const path = require('path');

// third-party production modules/dependencies 
const express = require('express');
const bodyParser = require('body-parser');

// local modules
const adminRoutes = require('./routes/admin');
const shopRoutes = require('./routes/shop');

//************************* 2. express function **************************

const app = express();



//************************* 3. parsing request body using bodyParser **************************

app.use(bodyParser.urlencoded({ extended: false }));
// parsing the incomming request body 
// should be done by another middleware(body-parser) before routing middleware

// here urlencoded function returns a function (req,res,next)=>{...} , where it has logic 
// of parsing the body and also calls the next() function for us. 

//************************* 4. static access **************************


app.use(express.static(path.join(__dirname,'public')));


//************************* 5. using routes imported from routes/admin **************************

app.use(adminRoutes);
// app.use('/admin',adminRoutes); // adding common routing /admin/.. for all the routes in admin module 
// to use the admin routes , the order of where you place this matters 



//************************* 6. note on .use function **************************

// .use , allows us to add middleware functions
app.use((req, res, next) => { // defualt path = '/'
    // console.log('In the middleware!, this always runs');

    // * next is a function which allows the request to funnel to the 
    // * new function/middleware in the line for further processing
    next();
    // if the next is not called express won't look for another middleware
    // it means that its time to send response.(see the function below)
});



//************************* 7. using routes imported from routes/shop **************************

app.use(shopRoutes);



//************************* 8. Implementing 404 error for unknown path **************************

app.use((req, res, next) => {
    // res.status(404).send('<h1> Page not Found </h1>');
    res.status(404).sendFile(path.join(__dirname,"views","404.html"));
});



//************************* 9. creating and listning to the server **************************

// app.listen internally creates the server and starts listining 
app.listen(3000); // see in applicaiton.js file on github

// const server = http.createServer(app);
// server.listen(3000);

