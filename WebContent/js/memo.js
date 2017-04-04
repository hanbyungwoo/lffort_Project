function input_data(data) {
  $('#calendar').fullCalendar({

    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay,listMonth'
    },
// defaultDate: '2016-12-12',
    navLinks: true, // can click day/week names to navigate views
    businessHours: true, // display business hours
    editable: true,
    events: [{
    	title : 'aaa',
    	start : '2017-04-04 09:00:00',
    	end : '2017-04-05 09:00:00',
    	constraint: 'availableForMeeting',
        color: '#606060'
    }]
      
      
    });
} 