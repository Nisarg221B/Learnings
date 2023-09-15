const express = require('express');
const shopController = require('../controllers/shop')
router = express.Router();


router.get('/cart', shopController.getCartPage);
router.get('/products',shopController.getProductsPage);
router.get('/checkout',shopController.getCheckoutPage);
router.get('/orders',shopController.getOrdersPage);
router.get('/', shopController.getIndex);

module.exports = router;
