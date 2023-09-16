const Cart = require('../models/cart');
const Product = require('../models/product');


exports.getProductsPage = (req, res, next) => {
    Product.fetchAll((products) => {
        return res.render('shop/product-list', {
            prods: products,
            path: '/products',
            pageTitle: 'products',
        });
    });
};

exports.getProductDetailsPage = (req, res, next) => {
    const prodID = req.params.productId; // getting the parameters from request url
    Product.findByID(prodID, product => {
        return res.render(
            'shop/product-detail', 
            { 
                product: product, 
                pageTitle: product.title, 
                path: '/products'
            });
    })
}

exports.addToCart = (req,res,next)=>{
    const prodId = req.body.productID;
    Product.findByID(prodId,(product)=>{
        Cart.addProduct(prodId,parseFloat(product.price));
        return res.redirect('/cart');
    });
}

exports.postCartDeleteProduct = (req,res,next)=>{
    const prodId = req.body.productId;
    Product.findByID(prodId,product=>{
        Cart.deleteProduct(prodId,product.price);
        return res.redirect('/cart');
    });
};

exports.getCartPage = (req,res,next)=>{
    Cart.getProducts(cart =>{
        Product.fetchAll(products =>{
            const cartProducts = [];
            for(let product of products){
                const cartProductData = cart.products.find(prod => prod.id === product.id);
                if(cartProductData){
                    cartProducts.push({...product, qty: cartProductData.qty});
                }
            }
            return res.render('shop/cart',{
                path: '/cart',
                pageTitle: 'Your Cart',
                prods: cartProducts,
            });
        })
    })
}

exports.getOrdersPage = (req, res, next) => {
    return res.render('shop/orders', {
        pageTitle: 'Your Orders',
        path: '/orders'
    });
}

exports.getIndex = (req, res, next) => {
    return Product.fetchAll((products) => {
        res.render('shop/index', {
            prods: products,
            path: '/',
            pageTitle: 'HomePage'
        });
    });
}

exports.getCheckoutPage = (req, res, next) => {
    return res.render('shop/checkout', {
        pageTitle: 'checkout',
        path: '/checkout'
    });
}