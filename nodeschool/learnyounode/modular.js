var mymodule = require('./mymodule')

var dir = process.argv[2]
var ext = process.argv[3]

mymodule (dir, ext, function (err, data) {
  data.forEach(function (e) {
    console.log(e)
  })
})
