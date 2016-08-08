$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();

    if ($("#resume-buttons").length){
        // Hackety hackety hack hack hack...
        var pathname = $(location).attr("pathname");

        if (!pathname.startsWith("/resume") || pathname.match(/resume\/printable\/?$/)){
            $("#resume-buttons").empty();
            $("#resume-buttons").remove();
        }
    }
});