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
  }
};

module.exports = Trainer;


