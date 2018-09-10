/* eslint-disable */

$(document).ready(function() {
  $("#scrollTop").click(function () {
    $("html, body").animate({ scrollTop: 0 }, "normal");
    return false;
  });

  $(".glide .glide__slide").each(function(index, item) {
    var img = new Image();
    img.src = $(item).data("url");

    $(img).on("error", function() {
      img.src = $(item).data("url").replace(/\-2000\./, "-1000.");
      $(item).css("background-image", 'url(' + img.src + ')');
    });
    $(img).on("load", function() {
      if (this.width < this.height) {
        $(item).addClass("vertical");
      }
    });
  });
});

$(window).on("load", function() {
  $(".glide").each(function (i, el) {
    if ($(el).find("li.glide__slide").length < 2) {
      return;
    }
    // 사진이 2장 이상일 때만
    new Glide(el, {
      type: "carousel",
      gap: 0,
      autoplay: 2000,
      swipeThreshold: true,
      dragThreshold: true,
      touchAngle: 45,
      rewindDuration: 500,
      animationDuration: 500,
      animationTimingFunc: "ease-in-out"
    }).mount();
  });
});

$(document).scroll(function () {
  ($(this).scrollTop() < 20) ? $("#scrollTop").hide() : $("#scrollTop").show();
});

/* eslint-enable */
