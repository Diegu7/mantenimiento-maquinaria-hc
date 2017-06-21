//= require moment/min/moment.min
//= require fullcalendar/dist/fullcalendar.min
//= require fullcalendar/dist/locale/es

function fillCalendar(maintenances) {

}

$(document).ready(function() {
    $("#calendar").fullCalendar({
        locale: "es",
        header: {
            left: "prev,next today",
            center: "title",
            right: "month,agendaWeek,agendaDay"
        },
        events: "/events"
    });
});