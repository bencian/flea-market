$(document).on('turbolinks:load', function() {
    $("#menu-toggle").click(function(e) {
        $("#sidebar").toggle();
    });
})