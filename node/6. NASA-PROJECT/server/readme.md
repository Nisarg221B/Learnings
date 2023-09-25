### Morgan - Logger 

morgan(format, options)
Create a new morgan logger middleware function using the given format and options.
The format argument may be a string of a predefined name, a string of a format string, 
or a function that will produce a log entry.

The format function will be called with three arguments tokens, req, and res, 
where tokens is an object with all defined tokens, req is the HTTP request and 
res is the HTTP response. The function is expected to return a string that will 
be the log line, or undefined / null to skip logging.

*** some predefined logging formats
'combined' - :remote-addr - :remote-user [:date[clf]] ":method :url HTTP/:http-version" :status :res[content-length] ":referrer" ":user-agent"
'common'   - :remote-addr - :remote-user [:date[clf]] ":method :url HTTP/:http-version" :status :res[content-length]
'dev'      - :method :url :status :response-time ms - :res[content-length]
etc

use it as - morgan('tiny')


*** tokens
- some predefined tokes
    - tokens.method(req,res)
    - tokens.url(req,res)
    - tokens.status(req, res)
- Creating new token 
    - invoke morgan.token() with the name and a callback function , This callback function is expected 
    to return a string value. The value returned is then available as ":type" in this case:
    - morgan.token('type', function (req, res) { return req.headers['content-type'] })


*** logging using custom functions
morgan(function (tokens, req, res) {
  return [
    tokens.method(req, res),
    tokens.url(req, res),
    tokens.status(req, res),
    tokens['response-time'](req, res), 'ms'
  ].join(' ')
})

*** writing to a single file 
accessLogStream is a WriteStream created using fs.createWriteStream
- app.use(morgan('combined', { stream: accessLogStream }))

*** log file rotation
Simple app that will log all requests in the Apache combined format to one 
log file per day in the log/ directory using the rotating-file-stream module.

// create a rotating write stream
var accessLogStream = rfs.createStream('access.log', {
  interval: '1d', // rotate daily
  path: path.join(__dirname, 'log')
})
 
// setup the logger
app.use(morgan('combined', { stream: accessLogStream }))



- ### JEST - Testing in Node
    - Test Runner 
        - Finds all of the tests in your project , runs through them and gives you the result. 
    - Test Fixtures
        - test fixtures , fixtures is just how your tests are set up and organized by module and by individual test where each fixture can run in its own environment with its own sets of variables and data.
    - Assertions
        - allows us to run assertions.
    - Mocking 
        - 
In early days of node we had to get seperate package for each of this functionality above.
but now we have "jest" for javascript testing. 

- supertest  ( for easy http assertions)
