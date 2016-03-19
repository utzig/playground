function reduce(array, combine, start) {
  var current = start;
  for (var i = 0; i < array.length; i++)
    current = combine(current, array[i]);
  return current;
}

var arrays = [[1, 2, 3], [4, 5], [6]];
console.log(reduce(arrays, function(current, arr) {
    for (var i = 0; i < arr.length; i++) {
        current.push(arr[i]);
    }
    return current;
}, []));
// → [1, 2, 3, 4, 5, 6]
