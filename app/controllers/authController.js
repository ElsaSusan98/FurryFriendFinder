const db = require("../services/db");

const authController = {
  login: async (req, res) => {
    const { email, password } = req.body;
    try {
      const sql = "SELECT * FROM user_table WHERE user_email = ? AND user_password = ?";
      const [user] = await db.query(sql, [email, password]);
      if (user) {
        // You might want to set session variables here or generate JWT tokens for authentication
        res.redirect("/home"); // Redirect to home page upon successful login
      } else {
        res.status(401).send('Invalid username or password');
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal server error' });
    }
  },

  register: async (req, res) => {
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
      if (error.code === 'ER_DUP_ENTRY') {
        return res.status(400).json({ error: 'Email already registered', field: 'useremail' });
      } else {
        res.status(500).json({ error: 'Internal server error' });
      }
    }
  }
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
