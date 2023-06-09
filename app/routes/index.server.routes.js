/*
 * File: about_me.ejs
 * Author: Ling Lin 
 * StudentID: 301292283
 * Date: May 30, 2023 
 * Version:  1.0.0
 */

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Home' });
});

router.get('/about', function(req, res, next) {
  res.render('about', { title: 'About Me' });
});
router.get('/project', function(req, res, next) {
  res.render('project', { title: 'Projects' });
});
router.get('/contact', function(req, res, next) {
  res.render('contact', { title: 'Contact Me' });
});
router.get('/services', function(req, res, next) {
  res.render('services', { title: 'Services' });
});

module.exports = router;
