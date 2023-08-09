$(document).ready(function () {

    // Redirect from the main page to the resume page
    var pathname = $(location).attr("pathname");
    if (pathname == "/") {
        window.location.replace("/resume/");
    }

    // Add hoverable tooltips for resume buttons
    $('[data-toggle="tooltip"]').tooltip();

    // Make sure the PDF and "printable version" resume buttons only show up where they're supposed to.
    if ($("#resume-buttons").length) {
        // Hackety hackety hack hack hack...
        
        if (!pathname.startsWith("/resume") || pathname.match(/resume\/printable\/?$/)) {
            $("#resume-buttons").empty();
            $("#resume-buttons").remove();
        }
    }
});