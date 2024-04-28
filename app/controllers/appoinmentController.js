// In your appointmentController.js file
const db = require("../services/db");
const nodemailer = require("nodemailer");
const Appointment = require("../models/appoinment");

const appointmentController = {
    bookAppointment: async (req, res) => {
        const { name, phone, email, petName, petBreed, appointmentDate, appointmentTime, query } = req.body;
        const trainerId = req.params.id;
      
        if (!req.session.userId) {
          req.flash('error', 'You need to login to book an appointment');
          return res.redirect("/login");
        }
      
        try {
          // Insert appointment details into the database
          await Appointment.create(req.session.userId, trainerId, appointmentDate, appointmentTime);
      
          // Send email to trainer
          const trainerEmail = await getTrainerEmail(trainerId);
          await sendEmail(trainerEmail, name, phone, email, petName, petBreed, appointmentDate, appointmentTime, query);
      
          req.flash('success', 'Appointment booked successfully');
          res.redirect("/"); // Redirect to home page or wherever you want
        } catch (error) {
          console.error("Error booking appointment:", error);
          req.flash('error', 'Failed to book appointment');
          res.redirect("/");
        }
      }
};

async function getTrainerEmail(trainerId) {
    try {
      const sql = "SELECT trainer_email FROM trainer_table WHERE trainer_id = ?";
      const [rows] = await db.query(sql, [trainerId]);
      return rows[0].trainer_email;
    } catch (error) {
      console.error("Error getting trainer email:", error);
      throw error;
    }
  }
  
  async function sendEmail(trainerEmail, name, phone, email, petName, petBreed, appointmentDate, appointmentTime, query) {
    try {
      const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'furryfriendfinder1@gmail.com',
          pass: 'Friend@123'
        }
      });
  
      const mailOptions = {
        from: 'furryfriendfinder1@gmail.com',
        to: trainerEmail,
        subject: 'New Appointment Booking',
        html: `
          <h3>New Appointment Booking</h3>
          <p><strong>Name:</strong> ${name}</p>
          <p><strong>Phone:</strong> ${phone}</p>
          <p><strong>Email:</strong> ${email}</p>
          <p><strong>Pet Name:</strong> ${petName}</p>
          <p><strong>Pet Breed:</strong> ${petBreed}</p>
          <p><strong>Appointment Date:</strong> ${appointmentDate}</p>
          <p><strong>Appointment Time:</strong> ${appointmentTime}</p>
          <p><strong>Query:</strong> ${query}</p>
        `
      };
  
      await transporter.sendMail(mailOptions);
    } catch (error) {
      console.error("Error sending email:", error);
      throw error;
    }
  }
  
  module.exports = appointmentController;