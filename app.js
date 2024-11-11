// app.js
const express = require('express');
const app = express();
const port = 9090;

app.get('/', (req, res) => {
  res.send('Hello, World! from bubblesthedev');
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
