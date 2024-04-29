const db = require("../services/db");
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
            await Appointment.create(req.session.userId, trainerId, petName, petBreed, appointmentDate, appointmentTime, query);
            req.flash('success', 'Appointment booked successfully');
            res.redirect(`/trainer/${trainerId}`);
        } catch (error) {
            console.error("Error booking appointment:", error);
            req.flash('error', 'Failed to book appointment');
            res.redirect(`/trainer/${trainerId}`);
        }
    }
};

module.exports = appointmentController;
