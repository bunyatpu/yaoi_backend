/**
 * Created by adithep on 10/20/2017 AD.
 */

var dbUrl = (process.env.db_url !== undefined) ? process.env.db_url:"db";
var user = (process.env.db_url !== undefined) ? "snuffle":"root";
var pass = (process.env.db_url !== undefined) ? "jjtomson":"123456";

module.exports = {
  cfg_db_host: dbUrl,
  cfg_db_user: user,
  cfg_db_pwd: pass,
  cfg_MAX_POOL: 10,
  cfg_MIN_POOL: 0,
  cfg_IDLE: 10000,
  cfg_db_yaoi: "yaoi",

  //** config additional parameter */
  cfg_bypass_db: false, //if true == not check paid status
}