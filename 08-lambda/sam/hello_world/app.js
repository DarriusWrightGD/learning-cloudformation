const express = require("express");
const app = express();

app.get("/ping", (req, res) => {
  res.send("pong");
});

app.get("/hello-world", (req, res) => {
  res.send("Hello World!");
});

app.get("/healthcheck", (req, res) => {
  res.send({
    status: "ok"
  });
});

module.exports = app;
