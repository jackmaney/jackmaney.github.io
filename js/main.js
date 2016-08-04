$(document).ready(function(){
    var pathname = $(location).attr("pathname");
    if(pathname.match(/_printable\/?$/)){
        $("#printable-link").hide();
    }
});