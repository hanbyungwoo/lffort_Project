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
    events: 
      data
    });
} 

// function showObj(obj) {
//    var str = "";
//    for(key in obj) {
//       str += key+"="+obj[key]+"\n";
//    }

//    alert(str);
//    return;
// }