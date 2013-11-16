var isClose = true;
//var domainUrl = window.location.protocol + "//" + window.location.hostname + ":" + window.location.port;
//var logoutUrl =  domainUrl + "/Sessions/logout/";
//var logoutUrl = "http://localhost:9223/staff/logout/"

//var logoutUrl = "http://137.116.158.228:9991/hrform/staff/logout";

$(document).ready(function () {
    //alert('script loaded');
});

// Attach the event keypress to exclude the F5 refresh
$(document).bind('keypress', function (e) {
    if (e.keyCode == 116) {
        isClose = false;
    }
    if (e.ctrlKey && e.keyCode == 116) {
        isClose = true;
    }
    if (e.altKey && e.keyCode == 116) {
        isClose = true;// currently not work
    }
});

$(window).bind('beforeunload', function (e) {

    e = e || window.event;
    var y = e.pageY || e.clientY;
    if (y < 0) {
    }
    else {
        isClose = true;
    }
    if (isClose) {
        alert('E');
        $.ajax({
            url: "sessions/destroy",
            type: 'DELETE',
            cache: false,
            success: function () {
                //cleared successfully
            }
        });
    }
});