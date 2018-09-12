const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const UserModel = require('../models/userModel')
const passportJWT = require("passport-jwt");
const bcrypt   = require('bcrypt-nodejs');
const key = require('./key')
const UsersModel = require('../models/userModel')
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

const JWTStrategy   = passportJWT.Strategy;
const ExtractJWT = passportJWT.ExtractJwt;

passport.use('local-signin',new LocalStrategy(
  function(username, password, done) {

    //console.log('in passport username',username)
    UserModel.findOne({ where:{ username } }).then((user)=>{
      //console.log('in passport user',user.value())

      if(user === null){
        //console.log('error Incorrect username')
        return done(null, false, { message: 'Incorrect username.' });
      }

      if(!bcrypt.compareSync(password, user.dataValues.password)){
        return done(null, false, { message: 'Incorrect password.' });
      }

      //console.log('user',user.dataValues)

      return done(null, user.dataValues);

    }).catch((err)=>{
      //console.log('err',err)
      return done(err);
    })

  }
));

passport.use('local-signup',new LocalStrategy(
  {
    passReqToCallback: true,
    session: false
  },
  function(req,user_ref, password_ref, done) {
    //--
    var { username,password,email } = req.body

    //console.log('signup email:',email,'password:',password,'username:',username)
    //--

    try {

      if(username === ''){
        throw 'username is require'
      }

      if(password === ''){
        throw 'password is require'
      }

      if(email === ''){
        throw 'email is require'
      }

      
      UsersModel.findOne({ 
        where:{
          [Op.or]: [{email}, {username}]
        } 
      }).then((refUser)=>{
        
        const user = refUser;
        const hashPass = bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
    
        if(user === null){

          console.log('user null')
          const newUesr = new UsersModel({
            username,
            password:hashPass,
            email,
            regis_date:new Date().toISOString().replace(/T/, ' ').replace(/\..+/, '')
          })
        
          newUesr.save().then(()=>{
            
            return done(null, { username,password,email })


          }).catch((error)=>{

            return done(null, false, { message: error });
          })
          
        }else{

          console.log('have user',user)
          if(email === user.email){

            return done(null, false, { message: "Email is in use" });
          }else if(username === user.username){
            return done(null, false, { message: "Username is in use" });
          }else{
            return done('error');
          }

 
        
          
        }
    
      }).catch((err)=>{
        //console.log('1----err',err)
        //throw err
        return done(null, false, { message: err });
      })

      
    } catch (error) {
      console.log('2----error',error)
      return done(null, false, { message: error });
    }


  }
));

passport.use(new JWTStrategy({
    jwtFromRequest: ExtractJWT.fromAuthHeaderAsBearerToken(),
    secretOrKey   : key
  },
  function (jwtPayload, cb) {

    //console.log('jwtPayload',jwtPayload)
    return cb(null, jwtPayload);
  }
));

