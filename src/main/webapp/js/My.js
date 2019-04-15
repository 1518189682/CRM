//漂浮广告
$(function () {
	
    $("#ad_close").click(function () {
        $(this).parent(".ad").css("display", "none");
    });
    var typex = 1;
    var typey = 1;
    var stop = false;
    setInterval(function () { if (!stop) { Move($(".ad")); } }, 30);
    $(".ad").mouseover(function () {
        stop = true;
    });
    $(".ad").mouseout(function () {
        stop = false;
    });

    function Move(o) {
        if ($(o).length != 0) {
            change(o);
            if (typey > 0) {
                $(o).css("top", $(o).offset().top - $(document).scrollTop() + 1);
            } else if (typey < 0) {
                $(o).css("top", $(o).offset().top - $(document).scrollTop() - 1);
            }

            if (typex > 0) {
                $(o).css("left", $(o).offset().left - $(document).scrollLeft() + 1);
            } else if (typex < 0) {
                $(o).css("left", $(o).offset().left - $(document).scrollLeft() - 1);
            }
        }
    }

    function change(o) {
        if (typey > 0) {
            if ($(o).offset().top - $(document).scrollTop() + $(o).height() + 1 > $(window).height()) {
                typey = -1;
            }
        }
        if (typey < 0) {
            if ($(o).offset().top - $(document).scrollTop() - 1 < 0) {
                typey = 1;
            }
        }

        if (typex > 0) {
            if ($(o).offset().left - $(document).scrollLeft() + $(o).width() + 1 > $(window).width()) {
                typex = -1;
            }
        }
        if (typex < 0) {
            if ($(o).offset().left - $(document).scrollLeft() - 1 < 0) {
                typex = 1;
            }
        }
    }
});