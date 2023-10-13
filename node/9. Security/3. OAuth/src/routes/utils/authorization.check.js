function checkLoggedIn(req, res, next) {
    console.log("user is : " , req.user, " this user is varified thus allowed furthur");
    // here the req.user will be the id we obtained after deserializing
    const isLoggedIn = req.isAuthenticated() && req.user;
    if (!isLoggedIn) {
        return res.status(401).json({
            error: 'You must log in!',
        });
    }
    next();
}
module.exports.checkLoggedIn = checkLoggedIn;