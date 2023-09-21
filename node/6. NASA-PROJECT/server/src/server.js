const http = require('http');

const app = require('./app'); // seperating the express code 

const PORT = process.env.PORT || 8000; 
// see package.json "start" node to see env variable PORT=5000
// we can also receive arguments using process.arg

const server = http.createServer(app);

server.listen(PORT,()=>{
    console.log("listning on ",PORT);
});

