const { checkLoggedIn } = require('../utils/authorization.check');

const secretRouter = require('express').Router();

secretRouter.use(checkLoggedIn);

secretRouter.get('/', (req, res) => {
    return res.send('Your personal secret value is 42!');
});

module.exports = secretRouter;