process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')
const merge = require('webpack-merge');

module.exports = merge(environment, {
});
