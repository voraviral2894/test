const db = require("../config/db");
const config = require("../config/config");
const util = require("../helpers/response");
const message = require("../helpers/messages.json");

// to get list of random songs
async function getSongs(page = 1) {
  const rows = await db.query(
    `SELECT 
        s.id, s.name, s.album_name, s.type, TRUNCATE(s.length, 2) as length,s.media_url,s.cover_image,s.created_date,s.updated_date, c.name as category_name, GROUP_CONCAT(a.name ORDER BY a.id) as artists_name 
        FROM s003_songs s JOIN s001_categories c 
        ON c.id=s.category 
        JOIN s002_artists a ON FIND_IN_SET(a.id, s.artists) > 0
        WHERE 
        s.is_deleted = 0 
        GROUP BY s.id
        ORDER BY RAND()
        LIMIT ${config.listPerPage}`
  );
  const metaData = { page };
  const res = {
    data: rows,
    metaData
  };

  return rows.length > 0
    ? util.success(res, message.record_available)
    : util.error({}, message.record_not_available);
}

// to get song details by id
async function getSong(id) {
  if (!id) {
    return util.error({}, message.id_is_empty);
  }

  const rows = await db.query(
    `SELECT 
        s.id, s.name, s.album_name, s.type, TRUNCATE(s.length, 2) as length,s.media_url,s.cover_image,s.created_date,s.updated_date, s.category as category_id, c.name as category_name, s.artists as artists_ids, GROUP_CONCAT(a.name) as artists_name
        FROM s003_songs s JOIN s001_categories c 
        ON c.id=s.category 
        JOIN s002_artists a ON FIND_IN_SET(a.id, s.artists) > 0
        WHERE 
        s.id = ${id} 
        GROUP BY s.id`
  );

  const res = rows.length > 0 ? rows[0] : {};

  return rows.length > 0
    ? util.success(res, message.record_available)
    : util.error({}, message.record_not_available);
}

// to update song details by id
async function update(id, songDetails) {
  if (
    !songDetails.name ||
    !songDetails.length ||
    !songDetails.media_url ||
    !songDetails.artists
  ) {
    return util.error({}, message.required_parameters_null_or_missing);
  }

  const result = await db.query(
    `UPDATE s003_songs SET 
      name="${songDetails.name}", 
      album_name="${songDetails.album_name}", 
      type="${songDetails.type}", 
      length="${songDetails.length}", 
      media_url="${songDetails.media_url}", 
      cover_image="${songDetails.cover_image}", 
      category="${songDetails.category}", 
      artists="${songDetails.artists}",
      updated_date=NOW()
      WHERE id=${id}`
  );

  if (result.affectedRows) {
    return util.success(result, message.record_updated);
  } else {
    return util.success(result, message.record_update_failed);
  }
}

// to remove song by id
async function remove(id) {
  if (!id) {
    return util.error({}, message.id_is_empty);
  }

  const result = await db.query(`DELETE FROM s003_songs WHERE id=${id}`);

  if (result.affectedRows) {
    return util.success(result, message.record_deleted);
  } else {
    return util.success(result, message.record_delete_failed);
  }
}

module.exports = {
  getSongs,
  getSong,
  update,
  remove
};
