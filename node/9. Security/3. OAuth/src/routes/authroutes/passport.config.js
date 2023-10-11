const passport = require('passport');
const { Strategy } = require('passport-google-oauth20');

const config = {
    CLIENT_ID: process.env.client_id,
    CLIENT_SECRET: process.env.client_secret,
    COOKIE_KEY_1: process.env.COOKIE_KEY_1,
    COOKIE_KEY_2: process.env.COOKIE_KEY_2,
};

const AUTH_OPTIONS = {
    clientSecret: config.CLIENT_SECRET,
    clientID: config.CLIENT_ID,
    callbackURL: '/auth/google/callback'
};

function varifyCallback(accessToken, refreshToken, profile, done) {
    console.log('Google Profile', profile);
    // if the accesstoke or refreshtoken are valid we call done with no error and successful user profile retrivel
    done(null, profile);
};

passport.use(
    new Strategy(
        AUTH_OPTIONS,
        varifyCallback
    )
);

// Save the session to cookie
passport.serializeUser((user, done) => {
    done(null, user);
});

// read the session from the cookie
passport.deserializeUser((obj, done) => {
    done(null, obj);
});

// console.log(passport);

module.exports = passport;