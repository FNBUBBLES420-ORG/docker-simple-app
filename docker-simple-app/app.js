const http = require('http');
const port = 3000;

const requestHandler = (req, res) => {
  res.end('Hello, World from Docker!');
};

const server = http.createServer(requestHandler);

server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
