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
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.buttons
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
        placeholder: "Seleccione una área de mantenimiento",
        allowClear: true
    });

    $('form').bind('cocoon:after-insert', function(e, inserted_item) {
      inserted_item.find('select#products-list').select2();
    });

    $('.checkbox-class').change(function(e) {
        $($(this).data('toggle-div')).toggle(); 
        $('div#frequency_by_days').toggle();   
    });

    $('#paginated-table').DataTable({
        "info":     false,
        "pageLength": 10,
        "lengthChange": false,
        "dom": 'frt<"text-center"p>',
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        }
    });

    $('#maintenance-plan-details-table').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });

    $('#maintenance-plan-details-table2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });

    $('#maintenance-plan-details-table3').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
});


