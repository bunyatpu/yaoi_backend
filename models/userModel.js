
const db_yaoi = require('../config/db/db_yaoi');

const Sequelize = require('sequelize');
const UserModel = db_yaoi.define('users', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    username: {type: {type:Sequelize.STRING(255)}},
    password:{type: {type:Sequelize.STRING(255)}},
    email: {type:Sequelize.STRING(200)},
    regis_date: {type:Sequelize.DATE},
    status:{type:Sequelize.INTEGER}
}, {
  tableName: 'users',
  underscored:true
});

module.exports = UserModel;





