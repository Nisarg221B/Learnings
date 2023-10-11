require('dotenv').config();
const https = require('https');
const fs = require('fs');


const PORT = 3000;

const app = require('./app');

https.createServer({
    key: fs.readFileSync('./src/ssl-secret/key.pem'),
    cert: fs.readFileSync('./src/ssl-secret/cert.pem'),
}, app).listen(PORT, () => {
    console.log(`Listening on port ${PORT}...`)
});
