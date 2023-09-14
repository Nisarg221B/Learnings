const express = require('express');
const productsController = require('../controllers/products')
router = express.Router();

router.get('/', productsController.getProductsPage);

module.exports = router;
