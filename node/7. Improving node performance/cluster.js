const express = require('express');
const cluster = require('cluster');
const os = require('os');

const app = express();


function delay(duration) {
    const startTime = Date.now();
    while (Date.now() - startTime < duration) {
        // event loop is blocked... 
    }
}

app.get('/', (req, res) => {
    res.send(`Performance example ${process.pid}`);
});

app.get('/timer', (req, res) => {
    delay(9000);// stimulating 9sec of event loop block
    res.send(`Ding ding din!! ${process.pid}`);
})


if (cluster.isMaster) { 
    console.log(`Master has been started... ${process.pid}`);
    const numCPUs = os.cpus().length;
    // macbook pro 2018 has 8 logical cores and 4 physical cores
    // thus 8 worker processes are created
    for(let i = 0 ;i < numCPUs ;i++){
        cluster.fork();
    }
} else {
    console.log(`Worker process started...${process.pid}`);
    app.listen(9000);
}
 