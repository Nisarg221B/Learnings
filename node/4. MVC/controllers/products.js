const Product = require('../models/product');

exports.getAddProductPage = (req, res, next) => {
    res.render('add-product', {
        pageTitle: 'Add Product',
        path: '/add-product',
        activeAddProd: true,
    });
};

exports.postAddProduct = (req, res, next) => {
    const product = new Product(req.body.title);
    product.save();
    res.redirect('/');
};

exports.getProductsPage = (req, res, next) => {
    Product.fetchAll((products) => {
        res.render('shop', {
            prods: products,
            docTitle: 'Shop',
            path: '/',
            pageTitle: 'Shop',
            hasProduct: (products.length > 0),
            activeShop: true,
        });
    });
};