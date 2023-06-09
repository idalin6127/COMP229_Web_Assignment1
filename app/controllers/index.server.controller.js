/*
 * File: about_me.ejs
 * Author: Ling Lin 
 * StudentID: 301292283
 * Date: May 30, 2023 
 * Version:  1.0.0
 */

exports.render = function (req, res) {
    res.render('index', {
        title: 'Hello World'
    })
};
