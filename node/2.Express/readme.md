## Using Express.js 

- #### What is Express.js ?

  - Express.js is Node.js framework - a package that adds a bunch of utility functions
    and tools and a clear set of rules on how the app should be built (middleware!).


- #### Using Middleware, next() and res()

  - express.js relies heavily on middleware functions - you can easily add them by calling
    use()
  - Middleware functions handle a request and should call next() to forward the request
    to the next function inline or send a response.
  - <b>see "6. note on .use function" in server.js file</b>
  some interesting middlewares
  - <b>3. parsing request body using bodyParser (see server.js)</b>


- #### Working with Requests/Responses and Routing

  - you can filter requests by path and method('get','post' etc)
  - if you filter by method,paths are mactched exactly, otherwise the first segment of a URL is matched.
  - You can use the express.Router to split your routes across files elegantly.
    - <b>see routes/admin.js</b>
    - <b>see "5. using routes imported from routes/admin" in server.js</b>

  - also note that these imported routes are added in order and the place at which the app.use(someRoutes) is written , order and place matters.
  - you can use res.redirect insted of setting statuscode and location manually
    - <b>see routes/admin.js router.post(/add-product) function </b>

- #### Returning HTML Pages (Files)

  - you can sendFile()s to your users- eg HTML files
    - you can set the path of the file manually or using core-module named path
    - see the details at
      - <b> routes/shop.js router.get('/',...) function </b>
        - also see how you can export rootdir of the project
        - <b> util/path.js using path.dirname(...) </b>
          and import it
        - <b> routes/admin.js router.get('/add-product',...)</b>

  - if a request is directly made for a file (eg a css file is requested), you can enable static serving for such files via express.static()
    - see "4. static access" in server.js file
    - see comment in /views/shop.html file

- #### Note
  - express and bodyparser has to be production dependency as they will be in use when the app is launched.
  - meanwhile nodeman can just be a development dependency as its just a helper tool for developement and has no effect at runtime.
