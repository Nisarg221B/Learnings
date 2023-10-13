const passport = require('passport');
const cookieSession = require('cookie-session');
const express = require('express');

const sessionConfigRouter = express.Router();

const config = {
    COOKIE_KEY_1: process.env.COOKIE_KEY_1,
    COOKIE_KEY_2: process.env.COOKIE_KEY_2,
};

// Save the session to cookie
// this function is only called when we authenticate any user
// this function is called idhar by any third-party authentication Strategy we use in passport
// in this case it is called by passport-google-Oauth20 strategy when we call done(null,user) on
// varify function then this function is called.
passport.serializeUser((user, done) => {
    console.log('\ninside serializeUser funciton');
    console.log('here after user is varified by varify function we passed in google-strategy\n');
    done(null, user.id);
});

// read the session from the cookie
passport.deserializeUser((obj, done) => {
    /*
    example: 
    User.findById(id).then(user=>{
        done(null,user);
    })
    */
    console.log("\ninside deserializeUser function");
    console.log("first we deserialize the user from requesting comming from client");
    console.log("and we populated req.user with that obj(which in this case is just an id)");
    console.log("id : ",obj,"\n");
    done(null, obj);
});

// registers a session stragety 
// and sets req.user 
sessionConfigRouter.use(cookieSession({
    name: 'session',
    maxAge: 24 * 60 * 60 * 1000,
    // keys: ['secret key for rotation','secret key'],
    keys: [config.COOKIE_KEY_1, config.COOKIE_KEY_2],
}));

// passport middleware which helps us to set up passport specifically the passport session
// This middleware must be in use by the Connect/Express application for Passport to operate
sessionConfigRouter.use(passport.initialize());

// passport.session() athenticates the session thats being sent to our server , it uses 
// the keys we set in cookie-session and validates that everything is signed as it should be
// and then sets the user property on req object (req.user) to contain the users identity 
// i.e  it calls passport.deserializeUser internally
sessionConfigRouter.use(passport.session());

module.exports.passport = passport;
module.exports.sessionRouter = sessionConfigRouter;
