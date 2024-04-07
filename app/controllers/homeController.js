const db = require("../services/db");
const Trainer = require("../models/trainers");

const homeController = {
  index: (req, res) => {
    res.render("index");
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
    res.render("register");
  },

  blog: (req, res) => {
    res.render("blog");
  },

  aboutUs: (req, res) => {
    res.render("aboutUs");
  },

  finder: (req, res) => {
    res.render("finder");
  },
  forgot: (req, res) => {
    res.render("forgot");
  }
};

module.exports = homeController;
