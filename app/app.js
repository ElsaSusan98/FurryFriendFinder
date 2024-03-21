// Import express.js
const express = require("express");
const bodyParser = require('body-parser');
const User = require('./user');
const db = require('./services/db');

// Create express app
var app = express();

// Add static files location
app.use(express.static("public"));


app.set('view engine','pug');
app.set('views','./app/views');

// Create a route for root - /
app.get("/", function(req, res) {
    res.render("index");
});
app.get("/home", function(req, res) {

    res.render("home");
});

app.get("/register", function(req, res) {

    res.render("register");
});

// Serve static files. CSS, Images, JS files ... etc

// Get home page
app.get('/home', (req, res, next) => {
    let user = req.session.user;

    if(user) {
        res.render('home', {opp:req.session.opp, name:user.fullname});
        return;
    }
    res.redirect('/');
});



// Post login data
app.post('/login', (req, res, next) => {
    // Creating an instance of the User object
    const user = new User();

    // Call the login function on the user object
    user.login(req.body.username, req.body.password, function(result) {
        if (result) {
            // Handling successful login
            req.session.user = result;
            req.session.opp = 1;
            res.redirect('/home');
        } else {
            // Handling failed login
            res.send('Username/Password incorrect!');
        }
    });
});






//Create a route for testing the db
app.get("/home", function(req, res) {
    // Assumes a table called test_table exists in your database
    sql = 'select * from trainer_table';
    db.query(sql).then(results => {
        console.log(results);
        res.send(results)
        res.render('home', { trainers:trainers });
    });
});
// console.log("hi");
// app.get("/home", function(req, res) {
//     // Retrieve trainers data from the database
//     const sql = 'SELECT * FROM trainer_table';
//     db.query(sql).then(trainers => {
//             // Log the trainers data
//             console.log('Trainers data:', trainers);
            
//             // Render the 'home' template and pass the 'trainers' data
//             res.render('home', { trainers:trainers });
//         })
//         .catch(error => {
//             // Log the error
//             console.error('Error retrieving trainers data:', error);
//             res.status(500).send('Error retrieving data from database');
//         });
// });

// Create a route for /goodbye
// Responds to a 'GET' request
app.get("/goodbye", function(req, res) {
    res.send("Goodbye world!");
});

// Create a dynamic route for /hello/<name>, where name is any value provided by user
// At the end of the URL
// Responds to a 'GET' request
app.get("/hello/:name", function(req, res) {
    // req.params contains any parameters in the request
    // We can examine it in the console for debugging purposes
    console.log(req.params);
    //  Retrieve the 'name' parameter and use it in a dynamically generated page
    res.send("Hello " + req.params.name);
});

// Start server on port 3000
app.listen(3000,function(){
    console.log(`Server running at http://127.0.0.1:3000/`);
});