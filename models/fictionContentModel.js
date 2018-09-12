
const db_yaoi = require('../config/db/db_yaoi');

const Sequelize = require('sequelize');
const FictionContentModel = db_yaoi.define('fiction_content', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    content_name: {type: {type:Sequelize.TEXT}},
    content: {type: {type:Sequelize.TEXT}},
    fiction_id:{type: {type:Sequelize.STRING(255)}},
    user_id: {type:Sequelize.INTEGER},
    order_render: {type:Sequelize.INTEGER},
    chapter: {type:Sequelize.INTEGER},
    status: {type:Sequelize.INTEGER},
    create_date:{type:Sequelize.DATE}
}, {
  tableName: 'fiction_content',
  underscored:true
});


module.exports = FictionContentModel;





