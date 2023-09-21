const path = require('path');

const express = require('express');

const rootDir = require('../util/path');

// using Routes from this file to server.js file 
const router = express.Router();
// router is also a middleware function 


router.get('/add-product',(req,res,next)=>{
    // console.log('Another middleware!');
    // defualt response header is 'text/html'
    // res.write('<h1> The "add Product" page');
    // res.write('<form action="/add-product" method="POST"><input type="text" name="title"><button type="submit">Add Product</button></form>')
    // res.write('</h1>');
    // res.send();
    
    // res.sendFile(path.join(__dirname,'..','views','add-product.html'));
    // or you can use the imported rootDir
    res.sendFile(path.join(rootDir,'views','add-product.html'));
});

// if request is of method type "POST" we can use app.post instead of app.use
router.post('/add-product',(req,res,next)=>{
    console.log(req.body);

    // instead of manually setting statuscode and location header
    res.redirect('/');
});

// exporting routes 
module.exports = router;