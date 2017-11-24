<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
<!-- 민경이 추가부분 -->

<!-- 슬라이드쇼 스크립트 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>

<!-- Main -->
<div id="main">
	<div class = "main_page"		style="margin:0;">
		<a href="mainmenu.do"><img src= "images/home_logo.PNG" style="float:left; margin:10px 10px -15px 10px; padding-left:20px;"></a>
		<img src= "images/line.png" style="width:100%; height:5px; margin:0px;">
	</div>
	
	<!--<div class = "box"		style="margin-top:-15px; padding:15px 0px 30px 0px; text-align:center; background:pink;">
	-->
	<div class = "box" style="margin-top:-10px;">
		<div class="cycle-slideshow" data-cycle-timeout=3000 >
			<img class="mySlides" src="images/cover1.png" style="width:100%">
			<img class="mySlides" src="images/cover2.png" style="width:100%">
			<img class="mySlides" src="images/cover3.png" style="width:100%">
  		</div>
	</div>
	
	<section class="two">
		<div class="container">
			<!-- 월별 부서 보안점수 (꺽은선그래프) -->
			<label for="myChart3">
			<label style="float:left;font-size:0.7em;">SMART 보안 솔루션</label>
			<h3>
				<span class="icon fa-area-chart">&nbsp;<font color="#f25252"><c:out value="${month_date}"/>월</font>&nbsp;부서 보안점수</span>
			</h3>
				<br /></label>
			<div class="row">
				<!-- Bar Chart -->
				<canvas id="myChart3"></canvas>

				<script>
					var maxNum = "<c:out value="${maxNumBar}"/>";
					maxNum *= 1;
					var h_barOptions2 = {
						legend : {
							display : true,
							position : 'bottom'
						},
						scales : {
							xAxes : [ {
								ticks : {
									min : 0,
									stepSize : 1,
									autoSkip : false
								}
							} ]
						}
					};
					var data_list2 = new Array();
					var name_list2 = new Array();
					<c:forEach items="${nameDept}" var="item">
					name_list2.push("${item}");
					</c:forEach>
					<c:forEach items="${scoreDeptList}" var="item">
					data_list2.push("${item}");
					</c:forEach>
					var ctx = document.getElementById('myChart3').getContext(
							'2d');
					var myChart = new Chart(ctx, {
						type : 'line',
						data : {
							labels : name_list2,
							datasets : [ {
								label : '부서별 보안점수',
								data : data_list2,
								lineTension : 0.3,
								fill : false,
								borderColor : 'purple',
								backgroundColor : 'transparent',
								pointBorderColor : 'purple',
								pointBackgroundColor : 'lightgreen',
								pointRadius : 5,
								pointHoverRadius : 15
							} ]
						},
						options : h_barOptions2
					});
				</script>
			</div>
			</div>
			</section>
			<section class="three">
		<div class="container">
			<!-- 사무실 점검항목 보안점수 (레이다그래프) -->
			<label for="myChart1">
			<h3><span class="icon fa-pie-chart">&nbsp;사무실 점검항목 보안점수</span></h3>
				<br /></label>
			<div class="row">
				<!-- Bar Chart -->
				<canvas id="myChart1"></canvas>

				<script>
				var max2 = "<c:out value="${max2}"/>";
				var step2 = "<c:out value="${stepSize2}"/>";
				max2 *= 1;
				step2 *= 1;
					var radarOption = {
						legend : {
							display : true,
							position : 'bottom'
						},
						scale:{
							ticks: {
								scaleOverride: true,
						        beginAtZero: true,
						        min:0,
						        max : max2,
						        stepSize: step2
							}
						}
					};
					var data_list2 = new Array();
					<c:forEach items="${scoreEachList}" var="item">
					data_list2.push("${item}");
					</c:forEach>
					var data_myList2 = new Array();  
					<c:forEach items="${scoreMyDeptEachList}" var="myItem">
					data_myList2.push("${myItem}");
					</c:forEach>

					var ctx = document.getElementById('myChart1');
					var myChart = new Chart(ctx,
							{
								type : 'radar',
								data : {
									labels : [ '책상정리', '청소상태', '소등상태', '환기상태',
											'문닫힘상태' ],
									datasets : [ 
										{
											label : '항목별 나의 부서 보안점수',
											backgroundColor : "rgba(0,0,200,0.2)",
											borderColor : "rgba(0,0,200,0.6)",
											radius : 6,
											pointRadius : 6,
											pointBorderWidth : 2,
											pointBackgroundColor : "indigo",
											pointBorderColor : "rgba(0,0,200,0.6)",
											pointHoverRadius : 10,
											data : data_myList2
										} ,
									    {
											label : '항목별 부서평균 보안점수',
											backgroundColor : "rgba(200,0,0,0.2)",
											borderColor : "rgba(200,0,0,0.6)",
											radius : 6,
											pointRadius : 6,
											pointBorderWidth : 2,
											pointBackgroundColor : "orange",
											pointBorderColor : "rgba(200,0,0,0.6)",
											pointHoverRadius : 10,
											data : data_list2
										}										
									             ]
								},
								options : radarOption
							});
				</script>
			</div>
			</div>
			</section>
	
	<!-- 끝 -->
</div>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>	
