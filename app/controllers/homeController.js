const db = require("../services/db");
const Trainer = require("../models/trainers");

const homeController = {
  index: (req, res) => {
    const flashMessages = req.flash(); // Get flash messages
    res.render("index", { flash: flashMessages }); // Pass flash message
  },

  home: async (req, res) => {
    try {
      // Assuming fetchTrainersData is moved to the Trainer model
      const trainers = await Trainer.fetchAll(); // Assuming Trainer model exists
      res.render('home', { trainers });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal server error' });
    }
  },
  register: (req, res) => {
    const flashMessages = req.flash(); // Get flash messages
    res.render("register", { flash: flashMessages }); // Pass flash messages to the register view
  },

  blog: (req, res) => {
    res.render("blog");
  },

  aboutUs: (req, res) => {
    res.render("aboutUs");
  },

  finder: async(req, res) => {
    try {
      // Assuming fetchTrainersData is moved to the Trainer model
      const trainers = await Trainer.fetchAll(); // Assuming Trainer model exists
      res.render('finder', { trainers });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }
};

module.exports = homeController;
