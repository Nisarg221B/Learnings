const Product = require('../models/product');

exports.postAddProduct = (req, res, next) => {
    const title = req.body.title;
    const imageUrl = req.body.imageUrl;
    const description = req.body.description;
    const price = req.body.price;
    const product = new Product(null,title,imageUrl,description,price);
    product.save();
    res.redirect('/');
};

exports.postEditProduct = (req,res,next)=>{
    const prodId = req.body.productId;
    const updatedTitle = req.body.title;
    const updatedPrice = req.body.price;
    const updatedImageUrl = req.body.imageUrl;
    const updatedDescription = req.body.description;
    const updatedProduct = new Product(
        prodId,
        updatedTitle,
        updatedImageUrl,
        updatedDescription,
        updatedPrice
    );
    updatedProduct.save();
    res.redirect('/admin/products');
}

exports.postDeleteProduct = (req,res,next) =>{
    const prodId = req.body.productId;
    console.log(prodId);
    Product.delete(prodId,()=>{
        return res.redirect('/admin/products');
    });
}

exports.getAddProductPage = (req, res, next) => {
    res.render('admin/edit-product', {
        pageTitle: 'Add Product',
        path: '/admin/add-product',
        editing: false,
    });
};

exports.getEditProductPage = (req, res, next) => {
    const editMode = req.query.edit;
    if(!editMode){
        return res.redirect('/');
    }
    const prodId = req.params.productId;
    Product.findByID(prodId,product =>{
        if(!product){
            return res.redirect('/');
        }
        res.render('admin/edit-product', {
            pageTitle: 'Edit Product',
            path: '/admin/add-product',
            editing: Boolean(editMode),
            product: product,
        });
    });
};

exports.getProductsPage = (req, res, next) => {
    Product.fetchAll((products)=>{
        res.render('admin/product-list', {
            prods: products,
            pageTitle: 'admin products',
            path: '/admin/products'
        });
    });
}