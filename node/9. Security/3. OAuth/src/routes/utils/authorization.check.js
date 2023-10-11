function checkLoogedIn(req, res, next) {
    const isLoggedIn = true; // toDO
    if (!isLoggedIn) {
        return res.status(401).json({
            error: 'You must log in!',
        });
    }
    next();
}
module.exports.checkLoogedIn = checkLoogedIn;