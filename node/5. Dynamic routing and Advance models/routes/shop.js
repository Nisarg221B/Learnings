const express = require('express');
const shopController = require('../controllers/shop')

router = express.Router();


router.get('/cart', shopController.getCartPage);
router.post('/cart', shopController.addToCart);
router.post('/cart-delete-item',shopController.postCartDeleteProduct);
router.get('/products',shopController.getProductsPage);
router.get('/products/:productId',shopController.getProductDetailsPage); // : <- signles that it can be anything 
router.get('/checkout',shopController.getCheckoutPage);
router.get('/orders',shopController.getOrdersPage);
router.get('/', shopController.getIndex);

module.exports = router;
