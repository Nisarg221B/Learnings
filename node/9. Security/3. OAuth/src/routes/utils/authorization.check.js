function checkLoggedIn(req, res, next) {

    // here the req.user will be the id we obtained after deserializing
    const isLoggedIn = req.isAuthenticated() && req.user;
    if (!isLoggedIn) {
        console.log("user is : " , req.user, " thus this user is unauthorized or unauthenticated therefore will be shown error");
        return res.status(401).json({
            error: 'You must log in!',
        });
    }
    console.log("user is : " , req.user, " this user is varified thus allowed furthur");
    next();
}
module.exports.checkLoggedIn = checkLoggedIn;