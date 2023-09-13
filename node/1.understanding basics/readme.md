### Basics 

- Node basics
    - Event loop
    - callback architecture

- Basic Server
    - 'http' core node module 
    - creating a server
    - writing the eventListner function for requests
    - req.url , req.method , req.headers , req.on (for setting event listners for specifics)
    - based on request url and method , sending the respective web page back as response
    - Streams and buffers for receiving data

- Module management 
    - Exporting and Importing local modules 
    - npm  (node package manager)
        - npm install --save express-session , --save flag is for production dependency
        - npm install --save-dev express-session, --save-dev flag is for development dependency
        - npm install -g express-session , -g flag is to install the module gloablly and avaialbe in at any system path
        - npm install , installs the dependencies mentioned in package.json file and updates them if necessary 

        - nodemon - hot reload kinda stuff 

        - if you install a third party package as project dependency (development or production)  
        - you should run the project through npm as it won't be available gloablly

- Types of Errors
    - Syntax Errors 
    - Runtime Errors
    - Logical Errors
        - Using VS-code Debugger
        - using nodemon for autorestarting debugger (see .vscode/launch.json file)

