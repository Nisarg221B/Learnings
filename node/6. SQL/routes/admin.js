const express = require('express');

const adminController = require('../controllers/admin');


const router = express.Router();
router.get('/add-product', adminController.getAddProductPage);
router.get('/products',adminController.getProductsPage);
router.get('/edit-product/:productId',adminController.getEditProductPage);

router.post('/add-product',adminController.postAddProduct);
router.post('/edit-product',adminController.postEditProduct);
router.post('/delete-product',adminController.postDeleteProduct);
// exporting routes 
module.exports = router;

