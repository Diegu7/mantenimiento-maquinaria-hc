//= require moment/min/moment.min
//= require fullcalendar/dist/fullcalendar.min
//= require fullcalendar/dist/locale/es

$(document).ready(function() {
    $("#calendar").fullCalendar({
        locale: "es",
        header: {
            left: "prev,next today",
            center: "title",
            right: "month,agendaWeek,agendaDay"
        },
        events: [
            {
                title: 'Mantenimiento de equipo de planta',
                start: '2017-05-11',
                end: '2017-05-13',
                color: '#4289f4'
            },
            {
                title: 'Revisión de equipo',
                start: '2017-05-15T12:30:00',
                end: '2017-05-15T15:30:00',
                color: '#892ab2'
            },
            {
                title: 'Mantenimiento de equipo de rodaje',
                start: '2017-05-15',
                color: '#f48341'
            },
            {
                title: 'Compra de repuesto',
                start: '2017-05-16T13:00:00',
                end: '2017-05-16T15:00:00',
                color: '#2d9b48'
            },
            {
                title: 'Mantenimiento de equipo de planta',
                start: '2017-05-17T08:00:00',
                start: '2017-05-17T10:30:00',
                color: '#4289f4'
            },
            {
                title: 'Revisión de equipo',
                start: '2017-05-17T05:30:00',
                end: '2017-05-17T08:30:00',
                color: '#892ab2'
            },
            {
                title: 'Mantenimiento de equipo de rodaje',
                start: '2017-05-18',
                end: '2017-05-20',
                color: '#f48341'
            },
            {
                title: 'Planeación',
                start: '2017-05-02T08:00:00',
                end: '2017-05-02T10:00:00',
                color: '#3de5dd'
            },
            {
                title: 'Revisión de inventario',
                start: '2017-05-31',
                end: '2017-05-31',
                color: '#e53c9c'
            },
            {
                title: 'Mantenimiento de equipo de rodaje',
                start: '2017-05-15T16:25:00',
                end: '2017-05-15T18:25:00',
                color: '#f48341'
            },
            {
                title: 'Mantenimiento de equipo de planta',
                start: '2017-05-15T06:00:00',
                start: '2017-05-15T07:30:00',
                color: '#4289f4'
            },
            {
                title: 'Compra de repuesto',
                start: '2017-05-19T13:00:00',
                end: '2017-05-19T15:00:00',
                color: '#2d9b48'
            },
            {
                title: 'Mantenimiento de equipo de planta',
                start: '2017-05-18T06:00:00',
                start: '2017-05-18T07:30:00',
                color: '#4289f4'
            },
        ]
    });
});