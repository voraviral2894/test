const express = require("express");
const router = express.Router();
const categories = require("../services/categories");

// GET - to get list of categories
router.get("/", async function (req, res, next) {
  try {
    res.json(await categories.getCategories(req.query.page));
  } catch (err) {
    console.error(`Error while getting list of categories`, err.message);
    next(err);
  }
});

module.exports = router;
