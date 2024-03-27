const express = require('express');
const fs = require('fs');
const path = require("path"); // 系统路径模块
const app = express();

app.get('/', (req, res) => res.send('hello world!'));

app.get("/json/landmarkData.json", (request, response) => {
  request.statusCode = 200;
  const file = path.join(__dirname, "./json/landmarkData.json");
  fs.readFile(file, "utf-8", (err, data) => {
    if (err) {
      response.send("文件读取失败！");
    } else {
      response.send(data);
    }
  });
});

app.listen(3000, () => console.log('Example app listening on port 3000!'));

/**
 *   
 * 
 * *** */