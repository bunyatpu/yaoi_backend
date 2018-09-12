
const db_yaoi = require('../config/db/db_yaoi');

const Sequelize = require('sequelize');
const CategoryModel = db_yaoi.define('category', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name		      : {type:Sequelize.STRING(255)},
    status        : {type:Sequelize.INTEGER},
    create_date		: {type:Sequelize.DATE}
}, {
  tableName: 'category'
});

module.exports = CategoryModel;
