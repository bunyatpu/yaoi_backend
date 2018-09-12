var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var passport = require('passport');
var cors = require('./middleware/cors')
var authRoute = require('./routes/auth_route')
var writingRoute = require('./routes/writing_route')
var auth = require('./middleware/auth')

//var session      = require('express-session');
require('./config/passport');

//var serverRenderer = require('./middleware/ssr/renderer').default


var app = express();
//set config
app.use(express.static(path.resolve(__dirname, 'client', 'build')));
app.use(express.static(path.resolve(__dirname, 'client','public')));
app.use(cors);
app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ limit: '50mb', extended: true }));
app.use(cookieParser());
//app.use(passport.initialize());

//--
//route api
app.use('/api/auth', authRoute);
app.use('/api/helloJWT',auth.reqAuth,(req,res)=>{
  console.log('is in helloJWT');
  res.json({status:true,msg:'passed'})
})
app.use('/api/writing',auth.reqAuth,writingRoute);
//--


//ssr
//app.use('*', serverRenderer);
//--

module.exports = app;