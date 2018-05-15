const conf = require('./gulp.conf');
const url = require('url');
const proxy = require('proxy-middleware');

module.exports = function () {
  var proxyOptions = url.parse('http://localhost:5000/api');
  proxyOptions.route = '/api';
  return {
    server: {
      baseDir: [
        conf.paths.tmp,
        conf.paths.src
      ],
      routes: {
        '/bower_components': 'bower_components'
      }
    },
    open: false,
    middleware: [
        proxy(proxyOptions)
    ]
  };
};
