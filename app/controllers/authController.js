const db = require("../services/db");
const nodemailer = require("nodemailer");
const Appointment = require("../models/appoinment");

const authController = {
  login: async (req, res) => {
    const { email, password } = req.body;
    try {
      const sql = "SELECT * FROM user_table WHERE user_email = ? AND user_password = ?";
      const [user] = await db.query(sql, [email, password]);
      if (user) {
        req.session.userId = user.user_id; // Store the user's ID in the session
        req.flash('success', 'Login successful'); // Set success flash message
        res.redirect("/home"); // Redirect to home page upon successful login
      } else {
        req.flash('error', 'Invalid username or password'); // Set error flash message
        res.redirect("/login"); // Redirect back to login page with flash message
      }
    } catch (error) {
      console.error(error);
      req.flash('error', 'Internal server error'); // Set error flash message
      res.redirect("/login"); // Redirect back to login page with flash message
    }
  },

  register: async (req, res) => {
    const { firstname, lastname, useremail, userphone, usertype, password, confirm_password } = req.body;

    try {
      // Check if the email is already registered
      const emailExists = await checkIfEmailExists(useremail);
      if (emailExists) {
        req.flash('error', 'Email already registered'); // Set error flash message
        return res.redirect("/register"); // Redirect back to register page with flash message
      }

      // Check if password and confirm password match
      if (password !== confirm_password) {
        req.flash('error', 'Password and confirm password do not match'); // Set error flash message
        return res.redirect("/register"); // Redirect back to register page with flash message
      }

      // Proceed with registration if all checks pass
      const sql = "INSERT INTO user_table (user_firstname, user_lastname, user_email, user_phonenumber, user_type, user_password) VALUES (?, ?, ?, ?, ?, ?)";
      const values = [firstname, lastname, useremail, userphone, usertype, password];
      await db.query(sql, values);
      req.flash('success', 'Registration successful'); // Set success flash message
      res.redirect("/home"); // Redirect to login page upon successful registration
    } catch (error) {
      console.error("Error:", error);
      if (error.code === 'ER_DUP_ENTRY') {
        req.flash('error', 'Email already registered');
        return res.redirect("/register");
      } else {
        req.flash('error', 'Internal server error');
        return res.redirect("/register");
      }
    }
  },

};

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
    throw error; // Rethrow the error to be caught by the caller
  }
}


module.exports = authController;
