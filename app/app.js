// Import express.js
const express = require("express");
const bodyParser = require("body-parser");
const db = require("./services/db");



// Create express app
var app = express();
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
// Add static files location
app.use(express.static("public"));

app.set("view engine", "pug");
app.set("views", "./app/views");

// Create a route for root - /
app.get("/", function(req, res) {
    res.render("index");
});
// Create a route for root - /
app.get("/login", function (req, res) {
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
    const { email, password } = req.body;
    try {
        const sql = "SELECT * FROM user_table WHERE user_email = ? AND user_password = ?";
        const [user] = await db.query(sql, [email, password]);
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

app.get("/register", function (req, res) {
    res.render("register");
  });


//create register router
app.post('/register', async function(req, res) {
    console.log("Received registration request");
    const { firstname, lastname, useremail, userphone, usertype, password, confirm_password } = req.body;
    
    try {
        // Check if the email is already registered
        const emailExists = await checkIfEmailExists(useremail);
        if (emailExists) {
            return res.status(400).json({ error: 'Email already registered', field: 'useremail' });
        }
        
        // Check if password and confirm password match
        if (password !== confirm_password) {
            return res.status(400).json({ error: 'Password and confirm password do not match', field: 'confirm_password' });
        }
        
        // Proceed with registration if all checks pass
        const sql = "INSERT INTO user_table (user_firstname, user_lastname, user_email, user_phonenumber, user_type, user_password) VALUES (?, ?, ?, ?, ?, ?)";
        const values = [firstname, lastname, useremail, userphone, usertype, password];
        await db.query(sql, values);
        console.log("Registration successful");
        res.status(200).send("Registration successful");
    } catch (error) {
        console.error("Error:", error);
        res.status(500).json({ error: 'Internal server error' });
    }
});


async function checkIfEmailExists(email) {
    try {
        const sql = "SELECT COUNT(*) AS count FROM user_table WHERE user_email = ?";
        const [rows] = await db.query(sql, [email]);
        if (rows.length > 0 && rows[0].count > 0) {
            return true; // Email exists
        } else {
            return false; // Email does not exist
        }
    } catch (error) {
        console.error("Error checking email existence:", error);
        return true; // Return true to handle the error gracefully
    }
}



//create a route for blog page

app.get("/blog", function (req, res) {
  res.render("blog");
});
//create a route for about us page

app.get("/aboutus", function (req, res) {
  res.render("aboutUs");
});
//create a route for finder page

app.get("/finder", function (req, res) {
  res.render("finder");
});
// app.get("/home", function(req, res) {

//     res.render("home");
// });




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
app.get("/goodbye", function (req, res) {
  res.send("Goodbye world!");
});

// Create a dynamic route for /hello/<name>, where name is any value provided by user
// At the end of the URL
// Responds to a 'GET' request
app.get("/hello/:name", function (req, res) {
  // req.params contains any parameters in the request
  // We can examine it in the console for debugging purposes
  console.log(req.params);
  //  Retrieve the 'name' parameter and use it in a dynamically generated page
  res.send("Hello " + req.params.name);
});

// Start server on port 3000
app.listen(3000, function () {
  console.log(`Server running at http://127.0.0.1:3000/`);
});
