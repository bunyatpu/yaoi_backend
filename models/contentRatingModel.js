
const db_yaoi = require('../config/db/db_yaoi');

const Sequelize = require('sequelize');
const ContentRating = db_yaoi.define('content_rating', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name		      : {type:Sequelize.STRING(255)},
    status        : {type:Sequelize.INTEGER},
    create_date		: {type:Sequelize.DATE}
}, {
  tableName: 'content_rating'
});

module.exports = ContentRating;
