// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets
//= require bootstrap-modal
//= require bootstrap-modalmanager
//= require admin-lte/dist/js/app.min
//= require jquery-slimscroll/jquery.slimscroll.min
//= require cocoon
//= require select2

$(document).ready(function() {
    $(".btn[data-deletion-path]").click( function() {
        $("#deletion-modal").modal("toggle");
        $("#delete-button").attr("href", $(this).data('deletion-path'));
    });

    $("tr[data-link]").dblclick(function() {
        window.location = $(this).data("link")
    });
    
    $('select#products-list').select2({
        placeholder: "Seleccione un producto",
        allowClear: true
    });

    $('select#machines-list').select2({
        placeholder: "Seleccione una máquina",
        allowClear: true
    });

    $('select#machine-areas-list').select2({
        placeholder: "Seleccione una máquina",
        allowClear: true
    });

    $('form').bind('cocoon:after-insert', function(e, inserted_item) {
      inserted_item.find('select#products-list').select2();
    });
});

