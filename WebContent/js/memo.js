function input_data(data) {
	
//	data = JSON.stringify(data);
//	alert(data);
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
    events: 
    	data
    });
}


//$(function() {
//
//	
//
//	$('#calendar').fullCalendar({
//		header: {
//			left: 'prev,next today',
//			center: 'title',
//			right: 'month,agendaWeek,agendaDay,listWeek'
//		},
//		editable: true,
//		eventLimit: true, // allow "more" link when too many events
//		navLinks: true,
//		events: 
//			[{"title":"MANAGER님 기타","start":"2017-03-02","end":"2017-03-02","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 기타","start":"2017-03-04","end":"2017-03-04","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 기타","start":"2017-03-06","end":"2017-03-06","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 기타","start":"2017-03-08","end":"2017-03-08","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 프로젝트","start":"2017-03-10","end":"2017-03-10","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 기타","start":"2017-03-12","end":"2017-03-12","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 교육","start":"2017-03-14","end":"2017-03-14","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 기타","start":"2017-03-16","end":"2017-03-16","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 회의","start":"2017-03-18","end":"2017-03-18","constraint":"availableForMeeting","color":"#606060"},{"title":"MANAGER님 회의","start":"2017-03-02","end":"2017-03-02","constraint":"availableForMeeting","color":"#606060"}]
//		
//	});
//});