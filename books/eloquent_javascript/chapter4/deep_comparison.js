function deepEqual(o1, o2) {
    for (var name in o1) {
        if (!(name in o2)) {
            return false;
        }

        // TODO: fix for typeof null == "object"

        var equal = true;
        if (typeof o1[name] == "object" && typeof o2[name] == "object") {
            equal = deepEqual(o1[name], o2[name]);
        }
        else {
            equal = (o1[name] === o2[name]);
        }

        if (equal == false) {
            return false;
        }
    }

    return true;
}

var obj = {here: {is: "an"}, object: 2};
console.log(deepEqual(obj, obj));
// → true
console.log(deepEqual(obj, {here: 1, object: 2}));
// → false
console.log(deepEqual(obj, {here: {is: "an"}, object: 2}));
// → true
