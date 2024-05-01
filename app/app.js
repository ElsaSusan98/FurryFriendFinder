const express = require("express");
const bodyParser = require("body-parser");
const session = require('express-session');
const flash = require('connect-flash');
const db = require("./services/db");

const authController = require("./controllers/authController");
const homeController = require("./controllers/homeController");
const trainerController = require("./controllers/trainerController");
const appointmentController = require("./controllers/appoinmentController");
const contactController = require("./controllers/contactController");

const app = express();

// Set up body parser middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Set up static file serving
app.use(express.static("public"));

// Set up session middleware
app.use(
  session({
    secret: 'secret',
    resave: false,
    saveUninitialized: true,
  })
);


app.use((req, res, next) => {
  res.locals.userId = req.session.userId;
  res.locals.userType = req.session.userType;
  res.locals.trainer = req.session.trainer;
  next();
});
// Set up connect-flash middleware
app.use(flash());

// Set up view engine
app.set("view engine", "pug");
app.set("views", "./app/views");

// Routes
app.get("/", homeController.index);
app.get("/login", homeController.index);
app.post("/login", authController.login);
app.get("/home", homeController.home);
app.get("/register", homeController.register);
app.post("/register", authController.register);
app.get("/blog", homeController.blog);
app.get("/aboutus", homeController.aboutUs);
app.get('/finder', trainerController.finder);
app.get('/trainer/:id', trainerController.details);
app.post('/book-appointment/:id', appointmentController.bookAppointment);
app.get("/logout",authController.logout);
app.get("/contact", homeController.contact);
app.get("/trainer-dashboard",trainerController.appoinments);
app.get("/trainer-profile/",trainerController.trainerprofile); // Updated route for fetching trainer profile
app.get('/trainer-profile-edit/:id', trainerController.editProfile);
app.post('/update-profile/:id', authController.updateProfile);
app.post('/delete-profile', authController.deleteProfile);
app.post("/contact", contactController.submitContactForm);

app.get("/goodbye", (req, res) => res.send("Goodbye world!"));
app.get("/hello/:name", (req, res) => res.send("Hello " + req.params.name));

// Start the server
app.listen(3000, () => {
  console.log(`Server running at http://127.0.0.1:3000/`);
});
