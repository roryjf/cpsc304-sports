// load packages
var express = require('express');
var app = express();
var path = require('path');
var router = express.Router();

var pathName = __dirname + "/public/";

//serve static files that exist in the public folder (ex. images, CSS files, and JavaScript files) 
//keep in mind that because of the "public" in the line below, all of your hrefs in the html files will be relative to the /public folder
app.use(express.static(path.join(__dirname, "public")));

// home page route (http://localhost:8080)
router.get('/', function(req, res) { 
     res.sendFile(path.join(pathName, "/sports/", "index.html"));
});

// apply the routes to our application
app.use('/', router);
 // start the server
app.listen(8080);
console.log('go to localhost:8080 in your browser.');

