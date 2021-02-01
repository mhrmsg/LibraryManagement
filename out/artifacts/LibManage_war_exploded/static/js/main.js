;
$("#header").load("./header.jsp");

let click = 0;
$("#refreshBook").on("mousedown", function () {
  click++;
  $("#refreshImg").addClass("imagerotate");
}).on("mouseup", function () {
  setTimeout(function () {
    if (click >= 1) {
      $("#refreshImg").removeClass("imagerotate");
      click = 0;
    }
  }, 600);
});




