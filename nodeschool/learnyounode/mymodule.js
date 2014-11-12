var fs = require('fs')
var path = require('path')

module.exports = function (dir, ext, callback) {
  var results = []
  fs.readdir(dir, function (err, data) {
    if (err) return callback(err)

    data.forEach(function (e) {
      if (path.extname(e) === ("." + ext)) {
        results.push(e)
      }
    })

    callback(null, results)
  })
}
