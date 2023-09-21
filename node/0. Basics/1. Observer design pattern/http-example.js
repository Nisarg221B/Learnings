const http = require('https');

const req = http.request('https://www.google.com', (res) => {
    res.on('data', (chunk) =>{
        console.log(`Data chunk: ${chunk}`);
    });

    res.on('end', () =>{
        console.log('no more data');
    })
});

req.end();

/*
Calling the writable.end() method signals that no more 
data will be written to the Writable

In this case writable is request
*/