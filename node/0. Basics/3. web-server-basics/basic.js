const http = require('http');

const PORT = 3000;

// here the server is also an instance of Eventemiiter class
const server = http.createServer();

server.on('request',(req, res) => {
    res.writeHead(200, {
        'Content-Type': 'applicaiton/json',
    });
    res.write("something new", (err) => {
        console.log(err);
    });
    res.end(JSON.stringify({ // internally it fires res.emit('finish') event
        id: 1,
        name: 'Nisarg Patel',
    }));
    res.on('finish', () => { // when res emits 'finish' event this callback is called
        console.log('it ends here');
    })  
});

server.listen(PORT, () => {
    console.log(`listning on port ${PORT}`);
}); // 127.0.0.1 => localhost