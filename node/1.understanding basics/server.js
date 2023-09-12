const http = require('http');

// 2. use destructuring
const {requestListner,info}= require('./route'); 
const {serverPort} = require('./route');

// 3. import whole module 
// const routes = require('./route');
// const requestListner = routes.handler;
// const info = routes.info;
// const serverPort = routes.serverPort

console.log(info);
// The HTTP module can create an HTTP server that listens to server ports and gives a response back to the client.
// Use the createServer() method to create an HTTP server
// createServer takes a request listener which gets executed for every request the server recives
const server = http.createServer(requestListner);

// the server object listens on port 3000
server.listen(3000);
console.log(serverPort);
