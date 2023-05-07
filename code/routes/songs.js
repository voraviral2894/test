const express = require("express");
const router = express.Router();
const songs = require("../services/songs");

// GET - to get list of songs
router.get("/", async function (req, res, next) {
  try {
    res.json(await songs.getSongs(req.query.page));
  } catch (err) {
    console.error(`Error while getting list of songs`, err.message);
    next(err);
  }
});

// GET - to get song details by id
router.get("/:id", async function (req, res, next) {
  try {
    res.json(await songs.getSong(req.params.id));
  } catch (err) {
    console.error(`Error while getting the song details`, err.message);
    next(err);
  }
});

// PUT - to update song details by id
router.put("/:id", async function (req, res, next) {
  try {
    res.json(await songs.update(req.params.id, req.body));
  } catch (err) {
    console.error(`Error while updating the song`, err.message);
    next(err);
  }
});

// DELETE - to remove song by id
router.delete("/:id", async function (req, res, next) {
  try {
    res.json(await songs.remove(req.params.id));
  } catch (err) {
    console.error(`Error while deleting the song`, err.message);
    next(err);
  }
});

module.exports = router;
