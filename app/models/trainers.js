// trainers.js
const db = require("../services/db");

const Trainer = {
  fetchAll: async () => {
    try {
      const sql = 'SELECT * FROM trainer_table';
      const trainers = await db.query(sql);
      return trainers;
    } catch (error) {
      console.error(error);
      throw error;
    }
  },
  
  // Add more methods as needed
};

module.exports = Trainer;
