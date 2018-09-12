const FictionModel = require('../models/fictionModel')
const CategoryModel = require('../models/categoryModel')
const ContentRatingModel = require('../models/contentRatingModel')
const UserModel = require('../models/userModel')
const FictionContentModel = require('../models/fictionContentModel')


const createWhere = (rawAttributes,params) => {
  var wheres = {}

  //Object.keys(FictionModel.rawAttributes)

  var fNameParams = Object.keys(params);
  var fNameModel = Object.keys(rawAttributes);

  fNameParams.forEach((i)=>{
    if(fNameModel.includes(i)){
      wheres[i] = params[i]
    }
  })

  return wheres;
}


const saveWriting = (params) => {

  return new Promise((resolve,reject)=>{

    try {

      //let params = req.body;
      let file = params.files;
      var newModel = { 
        user_id	: params.user_id,
        title	:params.title,
        synopsis	: params.articleSynopsis,
        author:params.authorName,
        category_id	: params.category,
        content_rating_id		: params.contentRating,
        preface			: params.article_rec,
        create_date:new Date().toISOString().slice(0, 10)
      }

      if(file !== undefined){
        newModel.cover_path_name = file.filename
      }

      //new
      FictionModel.findOrCreate({
        where:{
          id: params.id
        },
        defaults:newModel
      })
      .then((fiction)=>{

        const resFic = fiction[0]
        const created = fiction[1];
      
        if(!created){
          //update
          resFic.update(newModel)
          .then(() => {
            // title will now be 'foooo' but description is the very same as before
            //res.json({status:true,msg:'succ'})
            resolve({status:true,msg:'succ'})
          })

        }else{
          //res.json({status:true,msg:'succ'})
          resolve({status:true,msg:'succ'})
        }

        
      })
      .catch((error)=>{
        console.log('error 1',error)
        //res.json({status:'error',msg:error})
        reject({status:false,msg:error})
      })
      
    } catch (error) {
      //console.log('error 2',error.toString())
      reject({status:false,msg:error.toString()})
    }

   


  })

}

const getFictions = (obj) => {
  //where:{user_id:params.user_id}
  //order:[['id','DESC']]
  var where = createWhere(FictionModel.rawAttributes,obj.where)
  var order = (obj.order !== undefined) ?  obj.order:[]

  return new Promise((resolve,reject)=>{

    FictionModel
    .findAll({
      where:where,
      order:order
    })
    .then((models)=>{

      //res.json({status:true,values:models})
      // setTimeout(()=>{
      //   resolve({status:true,values:models})
      // },3000)

      resolve({status:true,values:models})
     
    })
    .catch((err)=>{
      console.log('err',err)
      //res.json({status:false,msg:err})
      reject({status:false,msg:err})
    })

  })

}

module.exports = {
  saveWriting,
  getFictions
}