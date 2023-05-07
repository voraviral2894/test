const express = require("express");
const router = express.Router();
const artists = require("../services/artists");

// GET - to get list of artists
router.get("/", async function (req, res, next) {
  try {
    res.json(await artists.getArtists(req.query.page));
  } catch (err) {
    console.error(`Error while getting list of artists`, err.message);
    next(err);
  }
});

module.exports = router;
