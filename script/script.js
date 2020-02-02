
var images= [];
for (i = 0; i < 4; ++i) {
    images[i] = new Image(120, 800);
}
images[0].src = "images/banner05.png";
images[1].src = "images/banner07.png";
images[2].src = "images/banner08.png";
images[3].src = "images/banner09.png";
var step = 0;
function slideIt() {
    if (!document.images) {
        return;
    }
    document.getElementById("slide").src = images[step].src;
    if (step < images.length - 1) {
        step++;
    }
    else {
        step = 0;
    }
    setTimeout("slideIt()", 3000);
}
