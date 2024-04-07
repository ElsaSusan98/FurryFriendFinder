const express = require("express");
const bodyParser = require("body-parser");
const db = require("./services/db");

const authController = require("./controllers/authController");
const homeController = require("./controllers/homeController");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static("public"));
app.set("view engine", "pug");
app.set("views", "./app/views");
// Example middleware to handle CORS headers
app.use((req, res, next) => {
  // Allow requests from all origins during development
  res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');
  // Set other CORS headers as needed
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
  // Continue to the next middleware
  next();
});


app.get("/", homeController.index);
app.get("/login", homeController.index);
app.post("/login", authController.login);
app.get("/home", homeController.home);
app.get("/register", homeController.register);
app.post("/register", authController.register);
app.get("/blog", homeController.blog);
app.get("/aboutus", homeController.aboutUs);
app.get("/finder", homeController.finder);
app.get("/forgot", homeController.forgot);

app.get("/goodbye", (req, res) => res.send("Goodbye world!"));
app.get("/hello/:name", (req, res) => res.send("Hello " + req.params.name));

app.listen(3000, () => {
  console.log(`Server running at http://127.0.0.1:3000/`);
});
