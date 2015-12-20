function prepend(elem, list) {
    var new_list = {
        value: elem,
        rest: list
    };
    return new_list;
}

function nthByIndex(list, n, index) {
    if (n == index) {
        return list.value;
    }
    else if (list.rest == null) {
        return undefined;
    }
    return nthByIndex(list.rest, n, index + 1);
}

function nth(list, n) {
    return nthByIndex(list, n, 0);
}

function arrayToList(arr) {
    var new_list = null;
    for (var i = arr.length - 1; i >= 0; i--) {
        new_list = prepend(arr[i], new_list);
    }
    return new_list;
}

function listToArray(list) {
    var arr = [];
    var n = 0;
    while ((value = nth(list, n)) !== undefined) {
        arr.push(value);
        n++;
    }
    return arr;
}

console.log(arrayToList([10, 20]));
// → {value: 10, rest: {value: 20, rest: null}}
console.log(listToArray(arrayToList([10, 20, 30])));
// → [10, 20, 30]
console.log(prepend(10, prepend(20, null)));
// → {value: 10, rest: {value: 20, rest: null}}
console.log(nth(arrayToList([10, 20, 30]), 1));
// → 20
