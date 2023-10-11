const { checkLoogedIn } = require('../utils/authorization.check');

const secretRouter = require('express').Router();

secretRouter.get('/secret', checkLoogedIn, (req, res) => {
    return res.send('Your personal secret value is 42!');
});

module.exports = secretRouter;