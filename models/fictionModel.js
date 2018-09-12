
const db_yaoi = require('../config/db/db_yaoi');
const Sequelize = require('sequelize');
const UserModel = require('./userModel');
const CategoryModel = require('./categoryModel');
const ContentRatingModel = require('./contentRatingModel');
const FictionContentModel = require('./fictionContentModel');

const FictionModel = db_yaoi.define('fiction', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    user_id	: {type:Sequelize.INTEGER},
    cover_path_name: {type:Sequelize.INTEGER},
    title	:{type: {type:Sequelize.STRING(255)}},
    synopsis	: {type:Sequelize.STRING(255)},
    author	: {type:Sequelize.STRING(255)},
    category_id	: {type:Sequelize.INTEGER},
    content_rating_id		: {type:Sequelize.INTEGER},
    preface			: {type:Sequelize.TEXT},
    amt_comment	: {type:Sequelize.INTEGER},
    amt_read	: {type:Sequelize.INTEGER},
    create_date				: {type:Sequelize.DATE},
    status:{type:Sequelize.INTEGER}
}, {
  tableName: 'fiction',
  underscored: true
});

FictionModel.belongsTo(UserModel)
FictionModel.belongsTo(CategoryModel)
FictionModel.belongsTo(ContentRatingModel)
FictionModel.hasMany(FictionContentModel)


module.exports = FictionModel;





