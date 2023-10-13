const { passport , sessionRouter } = require('./session.config');
const { Strategy } = require('passport-google-oauth20');

const config = {
    CLIENT_ID: process.env.client_id,
    CLIENT_SECRET: process.env.client_secret,
};

const AUTH_OPTIONS = {
    clientSecret: config.CLIENT_SECRET,
    clientID: config.CLIENT_ID,
    callbackURL: '/auth/google/callback'
};

function varifyCallback(accessToken, refreshToken, profile, done) {
    console.log('\ninside varifyCallback')
    console.log('Google Profile recieved in exchange of accesstoken : ', profile);
    console.log('calling done(null,profile) and passing the profile to get serialized\n');
    // if the accesstoke or refreshtoken are valid we call done with no error and successful user profile retrivel
    done(null, profile);
};

passport.use(
    new Strategy(
        AUTH_OPTIONS,
        varifyCallback
    )
);

// console.log(passport);

module.exports.passport = passport;
module.exports.sessionRouter = sessionRouter;