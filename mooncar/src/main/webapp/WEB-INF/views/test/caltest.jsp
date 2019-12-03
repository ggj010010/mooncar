<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<link href='/resources/js/fullcalendar-4.3.1/packages/core/main.css'
	rel='stylesheet' />
<link href='/resources/js/fullcalendar-4.3.1/packages/daygrid/main.css'
	rel='stylesheet' />
<link href='/resources/js/fullcalendar-4.3.1/packages/interaction/main.css'
	rel='stylesheet' />
<script  src='/resources/js/moment.min.js'></script>
<script src='/resources/js/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/resources/js/fullcalendar-4.3.1/packages/daygrid/main.js'></script>
<script src='/resources/js/fullcalendar-4.3.1/packages/interaction/main.js'></script>
<script src='/resources/js/fullcalendar-4.3.1/packages/moment/main.min.js'></script>

<title>Schedule</title>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
		    defaultView: 'dayGridMonth',
		    defaultDate: new Date(),
		    header: {
		      left: 'prev,next today',
		      center: 'title',
		      right: ''
		    },
		    dateClick: function(info) {
		        alert('Date: ' + info.dateStr);
		        alert('Resource ID: ' + info.resource.id);
		    },
		    ${Calendar }
		    /* events: [
		        { // this object will be "parsed" into an Event Object
		          title: 'The Title', // a property!
		          start: '2019-12-01', // a property!
		        }
		      ] */
		  });

		calendar.render();
	});
</script>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>