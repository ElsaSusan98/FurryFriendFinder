
const db = require("../services/db");
const Trainer = require('../models/trainers'); 

const trainerController = {
    
  finder: async (req, res) => {
    try {
      let trainers;
      if (req.query.query) {
        // If there is a search query
        trainers = await Trainer.search(req.query.query);
      } else {
        // If there is no search query, fetch all trainers
        trainers = await Trainer.fetchAll();
      }
      res.render('finder', { trainers, query: req.query.query || '' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal server error' });
    }
  },

  details: async (req, res) => {
    try {
      const trainer = await Trainer.findById(req.params.id);
      res.render('trainerPage', { trainer });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }
};


module.exports = trainerController;
