const usersList = ['nisarg', 'payal'];

function requestListner(req, res) {
    const url = req.url;
    const method = req.method;
    // console.log(url," ",method," ",req.headers);
    if (url === '/') {
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.write('<html>');
        res.write('<head><title>My First Page</title></head>');
        res.write('<body>');
        res.write('<h1>Greetings! from Nisarg</h1>');
        res.write('<h3>Register a User</h3>');
        res.write('<form action="/users" method="POST"><input type="text" name="user">');
        res.write('<button type="submit">Register</button>');
        res.write('</form>');
        res.write('</body>');
        res.write('</html>');
        return res.end();
    }
    if(url === "/users" && method === "POST"){
        let body = [];
        req.on('data',(chunk)=>{
            body.push(chunk);
        });

        req.on('end',()=>{
            let usr = Buffer.concat(body).toString().split('=')[1];
            console.log(usr);
            usersList.push(usr);
            res.statusCode = 302;
            res.setHeader('Location', '/users');
            res.setHeader('Method','GET');
            res.end();
        });
        return;
    }
    if (url === "/users") {
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.write('<html>');
        res.write('<head><title>users list page</title></head>');
        res.write('<body><h1>Registered Users</h1>');
        for (usr in usersList) {
            res.write(`<ul><li><b>${usersList[usr]}</b></li></ul>`);
        }
        res.write('<form method="POST" action="/"><button type="submit">back</button></form>')
        res.write('</body>');
        res.write('</html>');
        return res.end();
    }
}

module.exports = requestListner;