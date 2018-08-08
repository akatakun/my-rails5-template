const { environment } = require('@rails/webpacker')
const merge = require('webpack-merge');

var railsConfig = environment.toWebpackConfig();

module.exports = merge(railsConfig, {
});
