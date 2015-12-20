var size = 15;

function draw_line(odd) {
    var text = "";
    var pattern = " #";

    for (var i = 0; i < size; i++) {
        var index = odd ? i % 2 : (i + 1) % 2;
        text += pattern.slice(index, index+1);
    }

    return text;
}

for (var i = 0; i < size; i++) {
    console.log(draw_line((i + 1) % 2));
}
