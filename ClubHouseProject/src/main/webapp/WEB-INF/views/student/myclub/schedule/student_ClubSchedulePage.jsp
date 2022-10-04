<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리 스케줄러 페이지</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- custom -->
<link href="resources/custom/css/schedule.css" rel="stylesheet" />	
<script src="resources/custom/js/schedule.js" type="text/javascript"></script>

<style type="text/css">
.add-button {
    position: absolute;
    top: 1px;
    right: 230px;
    background: #2C3E50;
    border: 0;
    color: white;
    height: 35px;
    border-radius: 3px;
    width: 157px;
}
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      defaultDate: '2019-06-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      events: [
        {
          title: 'Business Lunch',
          start: '2019-06-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2019-06-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2019-06-18',
          end: '2019-06-20'
        },
        {
          title: 'Party',
          start: '2019-06-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2019-06-11T10:00:00',
          end: '2019-06-11T16:00:00',
          rendering: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2019-06-13T10:00:00',
          end: '2019-06-13T16:00:00',
          rendering: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2019-06-24',
          end: '2019-06-28',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        },
        {
          start: '2019-06-06',
          end: '2019-06-08',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
      ]
    });

    calendar.render();
  });

});

function click_add() {
	var url = "./student_ClubSchedulePopup";
	var name = "student_ClubSchedulePopup";
	var option = "width = 600, height = 600 left = 100, top=50,location=no";
	window.open(url,name,option);
};
</script>

</head>
<body>
<div id='calendar' style="position : relative;">
	<div>
		<button class = "add-button" type = "button" 
        	onclick="click_add();">일정 추가</button>
	</div>
</div>

</body>
</html>