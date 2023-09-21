const http = require('http');

const server = http.createServer();
const PORT = 3000;

const friends = [
    {
        id: 1,
        name: 'Nisarg patel',
    },
    {
        id: 1,
        name: 'Payal Panjwani',
    },
    {
        id: 1,
        name: 'Nikhil gupta',
    }
]

server.on('request', function (req, res) {

    const items = req.url.split('/');
    // /friends/2 => ['','friends,'2']

    // there has to be better way or just a package who has done all the hardwork 
    // to extract this paramterized variables
    // hint : express.js  

    if (items[1] === 'friends') { // enpoint /friends
        res.writeHead(200, {
            'Content-Type': 'text/plain',
        });

        if (items.length === 3) {
            res.end(JSON.stringify(friends[parseInt(items[2])]));
        } else {
            res.end(JSON.stringify(friends));
        }
    }
    else if (items[1] === 'messages') { // enpoint /messages
        res.write('<html>');
        res.write('<body>');
        res.write('<h1>hello Isaac!</h1>');
        res.write('</body></html>');
        http.req('https://www.youtube.com/',(res)=>{
            console.log(res.headers);
        });

        res.end();
    }
    else {
        res.statusCode = 404;
        res.end();
    }
})

server.listen(PORT, () => {
    console.log(`listning on port ${PORT}`);
});