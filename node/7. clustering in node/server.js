const express = require('express');
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
    // res.send(`Beep beep buuuum!! ${process.pid}`);
})

console.log(`Master has been started... ${process.pid}`);
console.log(`Worker process started...${process.pid}`);
app.listen(9000);

