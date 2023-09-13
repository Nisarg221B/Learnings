const path = require('path');


const express = require('express');
router = express.Router();

router.get('/',(req,res,next)=>{
    // console.log('Another middleware!');
    // defualt response header is 'text/html'
    
    // res.sendFile('/views/shop.html'); 
    // this won't work as the / is root of the system 
    // as sendFile takes aboslute path 

    // res.sendFile('views/shop.html', { root: `${__dirname}/../`});
    // You can use the above line by specifying the root 
    // the paths exiting the root won't be given permission to access those files outside the root
    // or you can use the core - path package and use path.join to create an absolute path

    res.sendFile(path.join(__dirname,'..','views','shop.html'));
});

module.exports = router;
