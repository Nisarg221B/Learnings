const passport = require('./passport.config');
// const authController = require('./auth.controller');

const express = require('express');
const authRouter = express.Router();

// passport middleware which helps us to set up passport specifically the passport session
// This middleware must be in use by the Connect/Express application for Passport to operate
authRouter.use(passport.initialize());
authRouter.use(passport.session());


// Here the passport.authenticate authenticates the user using google strategy registered
// using passport.use in passport.config.js file
// we pass the scope in options to retrive the items mentioned in the scope from google
authRouter.get('/auth/google', passport.authenticate('google', {
    scope: ['email', 'profile'],
}));

// once we get the callback from the google after the authentication and access grant is finished
// we get either a failure or a success based on which we get redirected
authRouter.get('/auth/google/callback',
    passport.authenticate('google', { // middleware 
        failureRedirect: '/auth/failure',
        successRedirect: '/',
        session: true
    }),
);

authRouter.get('/auth/google/callback', (req, res) => {
    console.log('Google called us Back!');
});

authRouter.get('/auth/failure', (req, res) => {
    return res.send('Failed to log in!');
})

authRouter.get('auth/logout', (req, res) => { });

module.exports = authRouter;
