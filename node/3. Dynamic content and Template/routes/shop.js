const path = require('path');


const express = require('express');
const {products} = require('./admin')
router = express.Router();

router.get('/', (req, res, next) => {
    // res.render uses default templating engine and returns that template - shop.pug
    res.render('shop', {
        prods: products,
        docTitle: 'Shop',
        path: '/',
        pageTitle: 'Shop',
        hasProduct: (products.length > 0),
        activeShop:true,
    });
    // we can pass the data which should be added in the view
});

module.exports = router;
