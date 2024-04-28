// trainers.js
const db = require("../services/db");


const Trainer = {
  fetchAll: async () => {
    // Assuming this method fetches all trainers from the database
   
    return await db.query('SELECT * FROM trainer_table');
  },
  search: async (query) => {
    // Assuming this method searches for trainers based on the query

    return await db.query('SELECT * FROM trainer_table WHERE trainer_name LIKE ? OR trainer_location LIKE ?', [`%${query}%`, `%${query}%`]);
  },
  findById: async (id) => {
    // Fetch a trainer by ID
    try {
      const trainer = await db.query('SELECT * FROM trainer_table WHERE trainer_id = ?', [id]);
      return trainer[0];
    } catch (error) {
      throw new Error(error);
    }
  }

};

module.exports = Trainer;


