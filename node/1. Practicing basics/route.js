const fs = require('fs');

function reqListner(req, res) {
    const url = req.url;
    const method = req.method;
    if (url === '/sendMessage') {
        res.write('<html>');
        res.write('<head><title>My First Page</title/<head>');
        res.write('<body><form action="/message" method="POST"><input type="text" name="Input_messages"><button type="submit">Send</button></form></body>');
        res.write('</html>');
        return res.end();
    }

    if (url === '/message' && method === 'POST') {
        const body = [];
        // data comes in chunks ( stream ) , so we can start working on the data early
        // buffer 

        // getting the request data
        // creating a eventlistner , here we are listning for data
        // this function will executing whenever there is some new chunk ready to be read
        req.on('data', (chunk) => {
            // console.log(chunk);
            body.push(chunk);
        });

        // this function will be fired when the node is finished parsing "incoming request"
        req.on('end', () => {
            // console.log(body);
            const parsedBody = Buffer.concat(body).toString();
            const message = parsedBody.split('=')[1];
            console.log(parsedBody);
            // writeFile vs writeFileSync
            fs.writeFile('message.text', message, (err) => {
                res.statusCode = 302;
                res.setHeader('Location', '/');
                return res.end();
            });
        });
        return;
        // returing here after registering the event listners for the above if condition
        // as we don't want the below code to be executed for this request.
    }

    // console.log(req.url, req.method, req.headers);
    // setHeader allows us to set new headers
    res.setHeader('Content-Type', 'text/html');
    // res.writeHead(200, {'Content-Type': 'text/html'}); // status code and object containing response header
    res.write('<html>'); // write a response to the client
    res.write('<head><title>My First Page</title></head>');
    res.write('<body><h1> Hello from Nisargs Server!</h1><form method="POST" action="sendMessage"><button type="submit">Send a Message</button></form> </body>');
    res.write('</html>');
    res.end(); // this is a basically part where the response is send back // end the response
};


// module.exports = reqListner;

// module.exports = { handler: reqListner, info: 'a request listner for node server' };

// module.exports.handler = reqListner;
// module.exports.info = 'a request listner for node server';

// console.log(module); // ** IMP **
// syntax supported just by node-js 
exports.requestListner = reqListner;
exports.info = 'a request listner for node server';
exports.serverPort = 'Starting server at 3000';