const path = require('path');

// require.main points to server.js "the main file which starts this program"
// require.main.filename returns a path to the file where server.js is 
module.exports = path.dirname(require.main.filename);