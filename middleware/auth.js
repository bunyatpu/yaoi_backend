var passport = require('passport');
const jwt = require('jsonwebtoken');
const bcrypt   = require('bcrypt-nodejs');
const key = require('../config/key')

const reqAuth = (req,res,next) => {

  passport.authenticate('jwt', function(err, user, info) {
    //console.log('authenticate->',err,user,info)
    try{

      if(err){
        throw err
      }

      if(!user){
        throw 'is error '+info.message
      }

      req.validateMsg = {user}
      return next()
      //return res.json({status:'test'})

    }catch(terr){
      res.json({status:'error',msg:terr})
    }
   
  })(req, res, next);

}


const validateLogin = (req,res,next) =>{

  passport.authenticate('local', function(err, user, info) {
    //console.log('authenticate err',err,user,info)
    try{
      if(err){
        throw err
      }

      if(!user){
        throw ''+info.message
      }
      req.validateMsg = {user}
      return next()
      //return res.json({status:'test'})

    }catch(terr){
      res.json({status:false,msg:terr})
    }
   
  })(req, res, next);
}

const signin = (req,res,next) =>{

  passport.authenticate('local-signin', function(err, user, info) {
    //console.log('authenticate err',err,user,info)
    try{
      if(err){
        throw err
      }

      if(!user){
        throw ''+info.message
      }
      //req.validateMsg = {user}

      //const user = req.validateMsg.user;
      delete user.password;
      const token = jwt.sign(user, key);

      res.json({status:true,user, token});
      //return res.json({status:'test'})

    }catch(terr){
      res.json({status:false,msg:terr})
    }
   
  })(req, res, next);
}

const signup = (req,res,next) =>{

  passport.authenticate('local-signup', function(err, user, info) {
    console.log('local-signup->',err,user,info)
    try{
      if(err){
        throw err
      }

      if(!user){
        throw ''+info.message
      }

      res.json({status:true});
    

    }catch(terr){
      res.json({status:false,msg:terr})
    }
   
  })(req, res, next);
}

module.exports = {
  reqAuth,
  validateLogin,
  signin,
  signup
}
