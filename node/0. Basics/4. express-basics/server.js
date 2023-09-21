const http = require('http');
const express = require('express');

const app = express();
const server = http.createServer();
const PORT = 3000;

const friends = [
    {
        id: 0,
        name: 'Nisarg patel',
    },
    {
        id: 1,
        name: 'Payal Panjwani',
    },
    {
        id: 2,
        name: 'Nikhil gupta',
    }
]

app.use((req, res, next) => { // middleware functions ( lets say login )
    const start = Date.now();
    console.log(`${req.method} ${req.url} , ip => ${req.ip}`);
    next();
    // actions go here....
    const delta = Date.now() - start;
    console.log(delta, 'ms');
});

app.use(express.json())// another middleware function - parsing body to json

app.get('/friends', (req, res) => { // enpoint /friends
    res.json(friends);
});

app.post('/friends', (req, res) => {
    if (!req.body.name) {
        return res.status(400).json({
            error: 'Missing friend name',
        });
    }
    const newFriend = {
        id: friends.length,
        name: req.body.name,
    };
    friends.push(newFriend);
    res.json(friends); // sending back a json 
});


app.get('/friends/:friendsID', (req, res) => { // enpoint /friends
    const friendsID = req.params.friendsID;
    if (friendsID < friends.length) {
        res.json(friends[friendsID]);
    }
    else {
        res.status(404).json({
            error: "friend does not exit"
        });
    }
});

app.get('/messages', (req, res) => { // enpoint /messages
    res.status(200);
    res.contentType('text/html');
    res.write('<html>');
    res.write('<body>');
    res.write('<h1>hello Isaac!</h1>');
    res.write('</body></html>');
    res.end();
});

app.get('/', (req, res) => {
    res.statusCode = 404;
    res.send();
});

app.listen(PORT, () => {
    console.log(`listning on port ${PORT}`);
});