const db = require("../services/db");

const Appointment = {
  create: async (userId, trainerId, appointmentDate, appointmentTime) => {
    try {
      const sql = "INSERT INTO appointment_table (user_id, trainer_id, appointment_date, appointment_time, appointment_status) VALUES (?, ?, ?, ?, ?)";
      const values = [userId, trainerId, appointmentDate, appointmentTime, 'pending'];
      await db.query(sql, values);
      return true;
    } catch (error) {
      console.error("Error creating appointment:", error);
      throw error;
    }
  }
};

module.exports = Appointment;