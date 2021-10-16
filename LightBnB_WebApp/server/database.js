const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');

//connecting to DB
const pool = new Pool({
  user: 'ettybarone',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});
/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {

  let emailFromUser = email.toLocaleLowerCase();
  let values = [emailFromUser];
  let user; 
  return pool.query(`SELECT * FROM users
                     WHERE email = LOWER($1)`, values)
  .then(res => res.rows[0])
  .catch((err) => {
    console.log(err.message);
  });
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  let values = [id];
  let user;
  return pool.query(`SELECT * FROM users
                     WHERE id = $1`, values)
  .then(res => res.rows[0])
  .catch((err) => {
    console.log(err.message);
  });
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {

  let name = user.name;
  let email = user.email;
  let password = user.password;
  let values = [name, email, password];
  return pool.query(`INSERT INTO users (name, email, password)
                     VALUES ($1, $2, $3)
                     RETURNING *;`, values)
  .then(res => res.rows[0])
  .catch((err) => {
    console.log(err.message);
  });
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  let values = [guest_id];
  return pool.query(`SELECT * FROM reservations JOIN properties
                     ON reservations.property_id = properties.id
                     WHERE guest_id = $1;`, values)
  .then(res => res.rows)
  .catch((err) => {
    console.log(err.message);
  //return getAllProperties(null, 2);
  });
};
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

 const getAllProperties = (options, limit = 10) => {
  return pool
    .query(`SELECT * FROM properties 
            JOIN property_reviews ON properties.id = property_reviews.property_id
            LIMIT $1`, [limit])
    .then(res => res.rows)
    .catch((err) => {
      console.log(err.message);
    });
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;

