<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%
	String cp = request.getContextPath();
%>


<!DOCTYPE html>
<html>

<head>
<title>사회보장정보원 보안시스템</title>
<!-- Bootstrap -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=cp%>/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/main.css" />

<link
	href="<%=cp%>/bootstrap/vendors/vendors/fullcalendar/fullcalendar.css"
	rel="stylesheet" media="screen">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

<script
	src="<%=cp%>/bootstrap/vendors/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body>

	<!-- Header -->



	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<div id="header">

					<div class="top">

						<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="images/avatar.jpg"
								alt="avarta" /></span>
							<h1 id="title">${emp_name}</h1>
							<p>${deptName}(${auth})</p>
						</div>

						<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="mainmenu.do" class="skel-layers-ignoreHref"><span
										class="icon fa-home">Home</span></a></li>
								<li><a href="officeSecurityChoice.do"
									class="skel-layers-ignoreHref"><span
										class="icon fa-pencil-square-o">사무실 보안점검 작성</span></a></li>
								<li><a href="watchKeepingForm.do"
									class="skel-layers-ignoreHref"><span
										class="icon fa-pencil-square">당직 근무일지 작성</span></a></li>

								<li><a href="listOfficeSecurity.do?page=1"
									class="skel-layers-ignoreHref"><span class="icon fa-list">보안
											점검 조회</span></a></li>
								<li><a href="listWatchKeeping.do?page=1"
									class="skel-layers-ignoreHref"><span class="icon fa-list">당직
											근무일지 조회</span></a></li>
								<li><a href="smartSecuritySolution.do"
									class="skel-layers-ignoreHref"><span
										class="icon fa-pie-chart">S.M.A.R.T 보안 솔루션</span></a></li>

								<li><a href="nightDutyTable.do"
									class="skel-layers-ignoreHref"><span
										class="icon fa-calendar-check-o">당직근무표</span></a></li>

								<s:authorize access="hasAuthority('ROLE_ADMIN')">
									<li><a href="updateDept.do" class="skel-layers-ignoreHref"><span
											class="icon fa-cog">부서 업데이트</span></a></li>
									<li><a href="updateManager.do"
										class="skel-layers-ignoreHref"><span class="icon fa-th">보안
												담당자 변경</span></a></li>
								</s:authorize>
							</ul>
						</nav>

					</div>

					<div class="bottom">

						<!-- Social Icons -->
						<div class="icons">
							<a href="${pageContext.request.contextPath}/j_spring_security_logout">
								<span class="icon fa-sign-out"></span>Log Out
							</a>
						</div>
					</div>
				</div>
			</div>

			<!--  MAIN  -->
			<div id="main">
				<section class="white">
					<div class="container">

						<header>
							<h2>당직근무 테이블</h2>
						</header>
								<!-- block -->
									<div class="block-content collapse in">	
											<div id='calendar'></div>	
									</div>
					</div>
				</section>
			</div>
		</div>
		<hr>
		<footer>
			<p>&copy; Vincent Gabriel 2013</p>
		</footer>
	</div>

	<style>
#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

.external-event { /* try to mimick the look of a real event */
	margin: 10px 0;
	padding: 2px 4px;
	background: #3366CC;
	color: #fff;
	font-size: .85em;
	cursor: pointer;
	z-index: 99999999;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}
</style>
	<!--/.fluid-container-->
	<script src="<%=cp%>/bootstrap/js/jquery.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/jquery.scrolly.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/jquery.scrollzer.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/skel.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/util.js"></script>
	<script src="<%=cp%>/bootstrap/js/main.js"></script>
	<script src="https://use.fontawesome.com/b24720279e.js"></script>
	<script src="<%=cp%>/bootstrap/js/bootstrap.js"></script>
			
	<script src="<%=cp%>/bootstrap/vendors/vendors/jquery-1.9.1.min.js"></script>
	<script src="<%=cp%>/bootstrap/vendors/vendors/jquery-ui-1.10.3.js"></script>
	<script src="<%=cp%>/bootstrap/vendors/vendors/fullcalendar/fullcalendar.js"></script>
	<script src="<%=cp%>/bootstrap/vendors/vendors/fullcalendar/gcal.js"></script>

	<script>
		$(function() {
			// Easy pie charts
			var calendar = $('#calendar')
					.fullCalendar(
							{
								header : {
									left : 'prev,next',
									center : 'title',
									right : 'month,basicWeek,basicDay'
								},
								selectable : true,
								selectHelper : true,
								select : function(start, end, allDay) {
									var title = prompt('Event Title:');
									if (title) {
										calendar.fullCalendar('renderEvent', {
											title : title,
											start : start,
											end : end,
											allDay : allDay
										}, true // make the event "stick"
										);
									}
									calendar.fullCalendar('unselect');
								},
								droppable : true, // this allows things to be dropped onto the calendar !!!
								drop : function(date, allDay) { // this function is called when something is dropped

									// retrieve the dropped element's stored Event Object
									var originalEventObject = $(this).data(
											'eventObject');

									// we need to copy it, so that multiple events don't have a reference to the same object
									var copiedEventObject = $.extend({},
											originalEventObject);

									// assign it the date that was reported
									copiedEventObject.start = date;
									copiedEventObject.allDay = allDay;

									// render the event on the calendar
									// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
									$('#calendar').fullCalendar('renderEvent',
											copiedEventObject, true);

									// is the "remove after drop" checkbox checked?
									if ($('#drop-remove').is(':checked')) {
										// if so, remove the element from the "Draggable Events" list
										$(this).remove();
									}

								},
								editable : true,
								// US Holidays
								events : 'http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic'

							});
		});

		$('#external-events div.external-event').each(function() {

			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title : $.trim($(this).text())
			// use the element's text as the event title
			};

			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex : 999999999,
				revert : true, // will cause the event to go back to its
				revertDuration : 0
			//  original position after the drag
			});

		});
	</script>
</body>

</html>