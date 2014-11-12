var fs = require('fs');

var buffer = fs.readFileSync(process.argv[2]);
var text = buffer.toString();
var array = text.split("\n");
console.log(array.length - 1)
