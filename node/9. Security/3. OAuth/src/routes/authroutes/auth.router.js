const { passport, sessionRouter}   = require('./passport.config');


const express = require('express');
const authRouter = express.Router();

authRouter.use(sessionRouter);

authRouter.get('/auth/google',(req,res,next)=>{
    if(!(req.isAuthenticated() && req.user)){
        res.redirect('/auth/google/login');
    }
    res.redirect('/');
});



// Here the passport.authenticate authenticates the user using google strategy registered
// using passport.use in passport.config.js file
// we pass the scope in options to retrive the items mentioned in the scope from google
authRouter.get('/auth/google/login',passport.authenticate('google', {
    scope: ['email'],
}));

// once we get the callback from the google after the authentication and access grant is finished
// we get either a failure or a success based on which we get redirected
authRouter.get('/auth/google/callback',
    passport.authenticate('google', { // middleware 
        failureRedirect: '/auth/failure',
        successRedirect: '/',
        // session: false, (true by default)
    }),
    (req, res) => {
        console.log('Google called us Back!');
    }
);


authRouter.get('/auth/failure', (req, res) => {
    return res.send('Failed to log in!');
})

authRouter.get('/auth/logout', (req, res) => { });

module.exports = authRouter;
