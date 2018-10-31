process.env.NODE_ENV = process.env.NODE_ENV || 'test';

const environment = require('./base');

module.exports = environment.toWebpackConfig();
