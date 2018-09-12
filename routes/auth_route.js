
var express = require('express');
var passport = require('passport');
var authRoute = express.Router();
//var authController = require('../controllers/authController')
var auth = require('../middleware/auth')

authRoute.use('/signup', auth.signup);
authRoute.use('/signin', auth.signin);

module.exports = authRoute;
