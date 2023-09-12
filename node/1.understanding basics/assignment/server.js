/*
    * Spin up a Node.js -driven Server (on port 3000)
  
    * Handle two Routes: "/" and "/users"
        ** Return some greeting text on '/'
        ** Return a list of dummy users (e.g. <ul><li>User1</li></ul>) 
    
    * Add a form with a "username" <input> to the "/" page and submit a POST request
        to "/create-user" upon a button click

    * Add the "/create-user" route and parse the incoming data (i.e the username) 
        and simply log it to the console
*/

const http = require('http');
const reqListner = require('./route');

const server = http.createServer(reqListner);
server.listen(3000);