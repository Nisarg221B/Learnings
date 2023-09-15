const Product = require('../models/product');


exports.getProductsPage = (req, res, next) => {
    Product.fetchAll((products) => {
        res.render('shop/product-list', {
            prods: products,
            path: '/products',
            pageTitle: 'products',
        });
    });
};

exports.getCartPage = (req, res, next) => {
    res.render('shop/cart', {
        pageTitle: 'Your cart',
        path: '/cart'
    });
}

exports.getOrdersPage = (req,res,next)=>{
    res.render('shop/orders', {
        pageTitle: 'Your Orders',
        path: '/orders'
    });
}

exports.getIndex = (req,res,next)=>{
    Product.fetchAll((products) => {
        res.render('shop/index', {
            prods: products,
            path: '/',
            pageTitle: 'HomePage'
        });
    });
}

exports.getCheckoutPage = (req, res, next) => {
    res.render('shop/checkout', {
        pageTitle: 'checkout',
        path: '/checkout'
    });
}