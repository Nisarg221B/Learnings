const path = require('path');
const express = require('express');

const router = express.Router();
const products = [];

router.get('/add-product', (req, res, next) => {
    // 1. rendering and sending the local variables 
    res.render(
        'add-product',
        {
            pageTitle: 'Add Product',
            path: '/admin/add-product',
            activeAddProd: true,
        });
});

router.post('/add-product', (req, res, next) => {
    products.push({ title: req.body.title });
    res.redirect('/');
});

// exporting routes 
module.exports.routes = router;
module.exports.products = products;
