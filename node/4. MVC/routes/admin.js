const express = require('express');

const productsController = require('../controllers/products');


const router = express.Router();
// /add-product -> GET
router.get('/add-product', productsController.getAddProductPage);
// /add-product -> POST
router.post('/add-product',productsController.postAddProduct);
// exporting routes 
module.exports = router;

