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
<script src='/resources/js/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/resources/js/fullcalendar-4.3.1/packages/daygrid/main.js'></script>
<script src='/resources/js/fullcalendar-4.3.1/packages/interaction/main.js'></script>
<script src='/resources/js/fullcalendar-4.3.1/packages/moment/main.min.js'></script>

<title>Schedule</title>

<script>
	/* var events;
	
	$j(document).ready(function() {

		$j.ajax({
			type : "GET", //전송방식을 지정한다 (POST,GET)
			url : "/Calendar",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
			dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
			error : function() {
				alert('통신실패!!');
			},
			success : function(data) {
				events = JSON.stringify(data.Calendar);
				alert(events);
			}

		});
	});
	 document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		alert(events);
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			defaultDate : new Date(),
			header : {
				left : 'prev,next today',
				center : 'title',
				right : ''
			},
			dateClick : function(info) {
				alert('Date: ' + info.dateStr);
				alert('Resource ID: ' + info.resource.id);
			},
			eventSources: [

			    // your event source
			    {
  					url: '/Calendar',
  					color: 'yellow',   // an option!
  					textColor: 'black' // an option!
				}
			    // any other sources...
			  ]
		
		});

		calendar.render();
	});  */
	$j(document).ready(function() {
		fn_get_events();
	});

	function fn_set_calendar(data){
		var calendarEl = document.getElementById('calendar');
		alert(data);
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			defaultDate : new Date(),
			header : {
				left : 'prev,next today',
				center : 'title',
				right : ''
			},
			dateClick : function(info) {
				alert('Date: ' + info.dateStr);
				alert('Resource ID: ' + info.resource.id);
			},
			events : data
		
		});

		calendar.render();
	}
		
	function fn_get_events()
	{
		$j.ajax({
			url: '/Calendar', 
			dataType: 'json', 
			success: function(plan) {
				fn_set_calendar(plan.Calendar);
			}
		}); 
	}
</script>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>