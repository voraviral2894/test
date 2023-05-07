const express = require("express");
const app = express();
const port = 3000;

const songsRouter = require("./routes/songs");
const categoriesRouter = require("./routes/categories");
const artistsRouter = require("./routes/artists");

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true
  })
);

// route for songs CRUD APIs
app.use("/songs", songsRouter);

// route for song categories API
app.use("/categories", categoriesRouter);

// route for song artist API
app.use("/artists", artistsRouter);

/* Error handler middleware */
app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  console.error(err.message, err.stack);
  res.status(statusCode).json({ message: err.message });
  return;
});

app.listen(port, () => {
  console.log(`Songs app listening at http://localhost:${port}`);
});
