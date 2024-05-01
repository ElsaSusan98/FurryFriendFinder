const db = require("../services/db");

const contactController = {
  submitContactForm: async (req, res) => {
    const { name, email, phone, subject, message } = req.body;
    try {
      const insertQuery = "INSERT INTO enquiry_table (name, email, phone_number, subject, message, enquiry_status) VALUES (?, ?, ?, ?, ?, 'Pending')";
      await db.query(insertQuery, [name, email, phone, subject, message]);
      req.flash('success', 'Message sent successfully');
      res.redirect("/contact");
    } catch (error) {
      console.error(error);
      req.flash('error', 'Internal server error');
      res.redirect("/contact");
    }
  }
};

module.exports = contactController;
