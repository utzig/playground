function range(start, end) {
    var values = [];
    var inc = 1;
    if (arguments.length == 3) {
        inc = arguments[2];
    }
    if (inc > 0) {
        for (var i = start; i <= end; i += inc) {
            values.push(i);
        }
    } else {
        for (var i = start; i >= end; i += inc) {
            values.push(i);
        }
    }
    return values;
}

function sum(arr) {
    var total = 0;
    for (var i = 0; i < arr.length; i++) {
        total += arr[i];
    }
    return total;
}


console.log(sum(range(1, 10)));
// 55
console.log(range(1, 10, 2));
// [1, 3, 5, 7, 9]
console.log(range(5, 2, -1));
// [5, 4, 3, 2]
