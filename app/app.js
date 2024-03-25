// Import express.js
const express = require("express");
const bodyParser = require('body-parser');
const User = require('./user');
const db = require('./services/db');



// Create express app
var app = express();
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
// Add static files location
app.use(express.static("public"));


app.set('view engine','pug');
app.set('views','./app/views');

// Create a route for root - /
app.get("/", function(req, res) {
    res.render("index");
});
// Create a route for root - /
app.get("/login", function(req, res) {
    res.render("index");
});
// Function to fetch trainers data from the database
async function fetchTrainersData() {
    try {
        const sql = 'SELECT * FROM trainer_table';
        const trainers = await db.query(sql);
        return trainers;
    } catch (error) {
        console.error(error);
        throw error;
    }
}

// Route for rendering homepage (/home)
app.get("/home", async function(req, res) {
    try {
        const trainers = await fetchTrainersData();
        res.render('home', { trainers });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

// Post login data
app.post('/login', async function(req, res) {
    const { username, password } = req.body;
    try {
        const sql = "SELECT * FROM user_table WHERE user_name = ? AND user_password = ?";
        const [user] = await db.query(sql, [username, password]);
        if (user) {
            // Fetch trainers data and render home template
            const trainers = await fetchTrainersData();
            res.render('home', { trainers });
        } else {
            res.status(401).send('Invalid username or password');
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    }
});


//create a route for blog page

app.get("/blog",function(req,res){
    res.render("blog");
})
// app.get("/home", function(req, res) {

//     res.render("home");
// });

app.get("/register", function(req, res) {

    res.render("register");
});


// Serve static files. CSS, Images, JS files ... etc

// // Get home page
// app.get('/home', (req, res, next) => {
//     let user = req.session.user;

//     if(user) {
//         res.render('home', {opp:req.session.opp, name:user.fullname});
//         return;
//     }
//     res.redirect('/');
// });









//Create a route for testing the db

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