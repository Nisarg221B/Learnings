const express = require('express');
const cluster = require('cluster');

const app = express();


function delay(duration) {
    const startTime = Date.now();
    while (Date.now() - startTime < duration) {
        // event loop is blocked... 
    }
}

app.get('/', (req, res) => {
    res.send('Performance example');
});

app.get('/timer', (req, res) => {
    //  delay(9000);// stimulating 9sec of event loop block
    /*
    Real life blocking functions (watch out for these)

    1. JSON.stringify({}) => '{}';
    2. JSON.parse('{}') => {};
    3. [3,324,5,2,3,4].sort()   (sorting)
    4. crypto functions
    */
    res.send('Ding ding din!!');
});


if (cluster.isPrimary) {
    console.log('Master has been started...');
    cluster.fork();
    cluster.fork();
} else {
    console.log('Worker process started');
}

app.listen(9000);