/*
 * file： server.js
 * author： Ling Lin
 * studentID： 301292283
 * date： May 29th 2023
 * version：  1.0.0
 */



process.env.NODE_ENV = process.env.NODE_ENV || 'development';
var express = require('./config/express');
var app = express();
app.listen(7000);
module.exports = app;

console.log('Server running at http://localhost:7000/');
