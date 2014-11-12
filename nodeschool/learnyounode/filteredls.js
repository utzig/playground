var fs = require('fs')
var path = require('path')

var dir = process.argv[2]
var ext = "." + process.argv[3]

fs.readdir(dir, function (err, list) {
  for (i in list) {
    if (path.extname(list[i]) === ext) {
      console.log(list[i])
    }
  }
})
