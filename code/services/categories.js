const db = require("../config/db");
const util = require("../helpers/response");
const message = require("../helpers/messages.json");

// to get list of categories
async function getCategories() {
  const rows = await db.query(
    `SELECT 
        id, name
        FROM s001_categories 
        WHERE 
        is_deleted = 0`
  );
  const res = {
    data: rows
  };

  return rows.length > 0
    ? util.success(res, message.record_available)
    : util.error({}, message.record_not_available);
}

module.exports = {
  getCategories
};
