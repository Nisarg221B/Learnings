## Passport js

The first is the main “Passport JS” library, and the second is the relevant “strategy” library.

- The primary “Passport JS” library is always required, and is used to maintain session information for authenticated users and also to provides a abstraction to support third-party strategies(i.e. you will import this library irrespective of the type of “Strategy” that you will use to authenticate the user).
- The secondary “strategy” library is dependent on the methodology you plan use to authenticate a user. eg. “passport-local”, “passport-facebook”, “passport-oauth-google” etc.

## Passport JS - Steps and Syntax

### 1. import libraries

```javascript
//Import Express
const express = require("express");
const app = express();

//Import the main Passport and Express-Session library
const passport = require("passport");
const session = require("express-session");

//Import the secondary "Strategy" library
const cookieSession = require("cookie-session");
const LocalStrategy = require("passport-local").Strategy;
const GoogleStrategy = require("passport-google-oauth20");
```

### 2. Initialize middleware

```javascript
// This is the basic express session({..}) initialization.
app.use(
  session({
    secret: "secret",
    resave: false,
    saveUninitialized: true,
  })
);

// registers a session stragety - client side "cookie-session"
app.use(
  cookieSession({
    name: "session",
    maxAge: 24 * 60 * 60 * 1000,
    // keys: ['secret key for rotation','secret key'],
    keys: [config.COOKIE_KEY_1, config.COOKIE_KEY_2],
  })
);

/* Note that additional middleware is required to persist login state,
so must use the `connect.session()` middleware before `passport.initialize()`
*/

// init passport on every route call.
app.use(passport.initialize());

// allow passport to use "express-session"
app.use(passport.session());
```

### 3. Use Passport to define the Authentication Strategy

```javascript
// registering the local strategy
passport.use(new LocalStrategy(authUser));
// The "authUser" is a function that we will define later will contain the steps
// to authenticate a user, and will return the "authenticated user".

// registering the google oauth2 strategy
passport.use(
  new GoogleStrategy(
    {
      clientSecret: config.CLIENT_SECRET,
      clientID: config.CLIENT_ID,
      callbackURL: "/login/google/callback",
    },
    (accessToken, refreshToken, profile, done) => {
      // after the authentication is done this varify callback is called
      // with accessToken and profile received from authorization server
      // here we can varify certain things from profile and store it in our database
      done(null, profile);
      // and then call the done callback done(err,user) which populates the req
      // with req.user
    }
  )
);
```

this both strategies are registere inside the passport.\_strategies object as "name" : strategy

```js
    passport._strategies={
        "google" = {...},
        "local"= {...},
        "session"= {...},
    }
```

### 3a. Define the "authUser" function to get authenticated Users

#### for local strategy
The “authUser” function is a callback function that is required within the LocalStrategy, and can takes three arguments.
The “user” and “password” are populated from the “req.body.username” and “req.body.password”. These can be used to search the DB to find and authenticate the username/password that was entered in the “login” form.

```javascript
authUser = (user, password, done) => {
//Search the user, password in the DB to authenticate the user
//Let's assume that a search within your DB returned the username and password match for "Kyle".
   let authenticated_user = { id: 123, name: "Kyle"}
   return done (null, authenticated_user )
}
```
- The “done()” function is then used to pass the “{authenticated_user}” to the serializeUser() function.
- Note, the done(<err>, <user>) function in the “authUser” is passed as ,
    1. If the user not found in DB, 
    done (null, false)
    2. If the user found in DB, but password does not match, 
    done (null, false)
    3. If user found in DB and password match, 
    done (null, {authenticated_user})

#### for google strategy
there is no need to add a authentication function seperately as from this module , Oauth2 based authentication
is already implemented and present under the strategy imported
```javascript
GoogleStrategy.authenticate(req,option)
```

### 4. Serialize and De-Serialize (authenticated) users

#### SerializedUser:

```javascript
passport.serializeUser((userObj, done) => {
    done(null, userObj)
});

```

1. "express-session" creates a "req.session" object, when it is invoked via app.use(session({..}))
2. "passport" then adds an additional object "req.session.passport" to this "req.session".
3. All the serializeUser() function does is, receives the "authenticated user" object from the "Strategy" framework, and attach the authenticated user to "req.session.passport.user.{..}"

- In above case we receive {id: 123, name: "Kyle"} from the done() in the authUser function in the Strategy framework, so this will be attached as req.session.passport.user.{id: 123, name: "Kyle"}

3. So in effect during "serializeUser", the PassportJS library adds the authenticated user to end of the "req.session.passport" object.
- This is what is meant by serialization.
- This allows the authenticated user to be "attached" to a unique session. 
- This is why PassportJS library is used, as it abstracts this away and directly maintains authenticated users for each session within the "req.session.passport.user.{..}"


#### De-serialize User:
- Now anytime we want the user details for a session, we can simply get the object that is stored in “req.session.passport.user.{..}”.
- We can extract the user information from the {..} object and perform additional search our database for that user to get additional user information, or to simply display the user name on a dashboard.

```javascript
passport.deserializeUser((userObj, done) => {
      done (null, userObj )
})
```

1. Passport JS conveniently populates the "userObj" value in the deserializeUser() with the object attached at the end of "req.session.passport.user.{..}"
2. When the done (null, user) function is called in the deserializeUser(), Passport JS takes this last object attached to "req.session.passport.user.{..}", and attaches it to "req.user" i.e "req.user.{..}"
- In our case, since after calling the done() in "serializeUser" we had req.session.passport.user.{id: 123, name: "Kyle"}, calling the done() in the "deserializeUser" will take that last object that was attached to req.session.passport.user.{..} and attach to req.user.{..} i.e. req.user.{id: 123, name: "Kyle"}
3. So "req.user" will contain the authenticated user object for that session, and you can use it in any of the routes in the Node JS app. 

eg. 

```javascript
app.get("/dashboard", (req, res) => {
    res.render("dashboard.ejs", {name: req.user.name})
})
```

### 5. Use passport.authenticate() as middleware on your login route

```javascript

// the above function will call local-strategy.authenticate() funciton that we registered before
app.post ("/login", passport.authenticate('local', {
   successRedirect: "/dashboard",
   failureRedirect: "/login",
}));


// as the GoogleStrategy supports Oauth2 
// the GoogleStrategy.authenticate function is implemented in a way that 

// if req.body.code is null it implies that its the authorization request has to be sent to 
// authorization server, thus GoogleStrategy.authenticate function redirects to google auth server
// and ask for authorization code which will include the what we want to get back from google 
// which we can metion in option-> scope.
app.get('/login/google', passport.authenticate('google', {
    scope: ['email', 'profile'],
}));


// if the req.body.code is not null implies that the req is a callback from authrization server with a authorization code
// step2 : thus we need to send this code, clientId and clientSecret to authorization server in exchange for accesstoken
// step3 : on successfull receiving of the accesstoken , this authenticate function tries to get the user profile against the accesstoken
// step4 : on successfull receiving of the user profile , it calls the varify callback we passed to it earlier
// and once we are done with varification and call done(err,user) , the user is then populated in req.user
// after which it is redirected to the appropriate route which we pass in the option.
app.get('/login/google/callback',
    passport.authenticate('google', { 
        failureRedirect: '/auth/failure',
        successRedirect: '/',
        session: true
    }),
);

```
### 6: Use the “req.isAuthenticated()” function to protect logged in routes
- Passport JS conveniently provides a “req.isAuthenticated()” function, that
    - returns “true” in case an authenticated user is present in “req.session.passport.user”, or
    - returns “false” in case no authenticated user is present in “req.session.passport.user”.
    - The “req.isAuthenticated()” function can be used to protect routes that can be accessed only after a user is logged in eg. dashboard.

Create a function as follows,
```javascript
checkAuthenticated = (req, res, next) => {
  if (req.isAuthenticated()) { return next() }
  res.redirect("/login")
}
```
Now you can use this function as middleware to protect your routes as follows,
```javascript
app.get("/dashboard", checkAuthenticated, (req, res) => {
  res.render("dashboard.ejs", {name: req.user.name})
})
```
Similarly, if the user is already logged in and attempt to access the “register” or “login” screen, you can direct them to the (protected) “dashboard” screen.

Create a function as follows,
```javascript
checkLoggedIn = (req, res, next) => {
  if (req.isAuthenticated()) { 
       return res.redirect("/dashboard")
   }
  next()
}
```
- Now you can use this function as middleware to as follows,

```javascript
app.get("/login", checkLoggedIn, (req, res) => {     
     res.render("login.ejs")
})
```

### 7: Use “req.logOut()” to clear the sessions object
Passport JS also conveniently provides us with a “req.logOut()” function, which when called clears the “req.session.passport” object and removes any attached params.

This can be used to implement log out as follows,

```javascript
app.delete("/logout", (req,res) => {
   req.logOut()
   res.redirect("/login")
   console.log(`-------> User Logged out`)
})
```
- Note that when the req.logOut() function is called, it clears both the “req.session.passport” and the “req.user” i.e.
    - "req.session.passport" -------> {}
    - "req.user" ------->  undefined


### Reference
- https://medium.com/@prashantramnyc/node-js-with-passport-authentication-simplified-76ca65ee91e5
- https://stackoverflow.com/questions/27637609/understanding-passport-serialize-deserialize
- https://www.passportjs.org/concepts/authentication/middleware/