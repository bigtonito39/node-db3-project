const knex = require("knex")
const Knexfile = require("../knexfile")

module.exports = knex(Knexfile.development)