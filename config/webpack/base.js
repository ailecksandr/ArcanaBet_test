'use strict';

const { environment } = require('@rails/webpacker');
const webpack         = require('webpack');

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $:      'jquery',
  jQuery: 'jquery',
  jquery: 'jquery'
}));

const config = environment.toWebpackConfig();

config.resolve = {
  extensions: ['.js', '.coffee', '.scss', 'css', 'sass'],
  alias: {
    jquery:  'jquery/src/jquery',
    styles:  'stylesheets',
    fonts:   'fonts',
    images:  'images',
    scripts: 'javascripts'
  }
};

module.exports = environment;
