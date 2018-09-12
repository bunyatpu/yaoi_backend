var express = require('express');
//var passport = require('passport');
var writingRoute = express.Router();
var multer  = require('multer')
const FictionModel = require('../models/fictionModel')
const CategoryModel = require('../models/categoryModel')
const ContentRatingModel = require('../models/contentRatingModel')
const UserModel = require('../models/userModel')
const FictionContentModel = require('../models/fictionContentModel')
const writingCtl = require('../controllers/writingController')
//var upload = multer({ dest: 'client/public/images/covers' })
//let upload  = multer({ storage: multer.memoryStorage() });
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'client/public/images/covers')
  },
  filename: function (req, file, cb) {
    cb(null, 'covers-' + Date.now() +'.'+file.originalname.split(".").pop(-1))
  }
})

var upload = multer({ storage: storage })


writingRoute.use('/addnew',upload.any(), function(req,res){
  

  let params = req.body;
  params.files = req.files[0];

  writingCtl.saveWriting(params).then((resSave)=>{

    res.json({status:true,msg:'succ'})

  }).catch((error)=>{
    res.json({status:'error',msg:error})
  })
    
 
  
});

writingRoute.use('/fetch_mywriting',function(req,res){
  let params = req.body;

  //console.log('rawAttributes',Object.keys(FictionModel.rawAttributes))
  var obj = {
    'where':{user_id:params.user_id},
    'order':[['id','DESC']]
  }

  writingCtl.getFictions(obj).then((resGet)=>{

    res.json({status:true,values:resGet.values})

  }).catch((error)=>{
    res.json({status:'error',msg:error})
  })



})

writingRoute.use('/fetch_category',function(req,res){

  CategoryModel.findAll()
  .then((models)=>{
    res.json({status:true,values:models})
  }).catch((err)=>{
    console.log('err',err)
    res.json({status:false,msg:err})
  })

})

writingRoute.use('/fetch_content_rating',function(req,res){

  ContentRatingModel.findAll()
  .then((models)=>{
    res.json({status:true,values:models})
  }).catch((err)=>{
    console.log('err',err)
    res.json({status:false,msg:err})
  })

})

writingRoute.use('/fetch_fiction_by_name',function(req,res){

  let params = req.body;

  //console.log('params',params)
  FictionModel.findOne({
    where:{id:params.id},
    include:[UserModel,CategoryModel,ContentRatingModel,FictionContentModel]
  }).then((models)=>{

    //console.log('models=>',models)
    res.json({status:true,values:models})
  })
  .catch((err)=>{
    console.log('err',err)
    res.json({status:false,msg:err})
  })
})

writingRoute.use('/fetch_fiction_by_id',function(req,res){

  let params = req.body;
  FictionModel.findOne({
    where:{id:params.id},
    include:[UserModel,CategoryModel,ContentRatingModel,FictionContentModel]
  }).then((models)=>{

    //console.log('models=>',models)
    res.json({status:true,values:models})
  })
  .catch((err)=>{
    console.log('err',err)
    res.json({status:false,msg:err})
  })
})

writingRoute.use('/save_content',upload.any(),function(req,res){

  let params = req.body;


  FictionContentModel.findOrCreate({
    where:{
      fiction_id: params.fiction_id,
      user_id: params.user_id,
      chapter: 1
    },
    defaults: { 
      content_name: '',
      content: params.content,
      fiction_id: params.fiction_id,
      user_id: params.user_id,
      order_render: 0,
      chapter: 1
    }
  })
  .then((user)=>{

    //console.log('then user',user)

    const resUser = user[0]
    const created = user[1];
  
    if(!created){
      //update
      resUser.update({ content: params.content })
      .then(() => {
        // title will now be 'foooo' but description is the very same as before
        res.json({status:true,msg:'succ'})
      })

    }else{
      res.json({status:true,msg:'succ'})
    }

    
  })
  .catch((error)=>{
    console.log(error)
    res.json({status:'error',msg:error})
  })


})

writingRoute.use('/fetch_new_article',function(req,res){

  let params = req.body;

  FictionModel
  .findAll({
    where:{status:0},
    order:[['create_date','DESC']],
    limit:4
  })
  .then((models)=>{

    res.json({status:true,values:models})
  })
  .catch((err)=>{
    console.log('err',err)
    res.json({status:false,msg:err})
  })
})

writingRoute.use('/fetch_by_cate',function(req,res){

  let params = req.body;

  FictionModel
  .findAll({
    where:{category_id:params.category_id},
    order:[['create_date','DESC']],
    limit:4
  })
  .then((models)=>{

    res.json({status:true,values:models})
  })
  .catch((err)=>{
    console.log('err',err)
    res.json({status:false,msg:err})
  })
})

writingRoute.use('/update_viewers',function(req,res){

  let params = req.body;

  FictionModel.findById(params.fiction_id).then(fiction => {
    return fiction.increment('amt_read', {by: 1})
  }).then(models => {
   
    

    models.reload().then(() => {
      //console.log('af update',models)
      res.json({status:true,values:models})

    })
  })
  .catch((err)=>{
    console.log('err',err)
    res.json({status:false,msg:err})
  })

})

module.exports = writingRoute;