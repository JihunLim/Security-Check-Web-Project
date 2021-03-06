<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>

<!-- Main -->
<div id="main">
	<div class = "main_page"		style="margin:0;">
		<a href="mainmenu.do"><img src= "images/home_logo.PNG" style="float:left; margin:10px 10px -15px 10px; padding-left:20px;"></a>
		<img src= "images/line.png" style="width:100%; height:5px; margin:0px;">
	</div>
	<!-- Intro -->
	<section id="top" class="one dark">
		<div class="container">
			<header>
				<h2>S.M.A.R.T 보안 솔루션</h2>
			</header>
		</div>
	</section>
		
		
		<section class="two">
		<div class="container">
			<!-- 월별 부서 보안점수 (꺽은선그래프) -->
			<label for="myChart3"><h3>
					□<c:out value="${month_date}"/>월 부서 보안점수
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
			<label for="myChart1"><h3>□ 사무실 점검항목 보안점수</h3>
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
									}, {
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
									} 
									             
									             ]
								},
								options : radarOption
							});
				</script>
			</div>
			</div>
			</section>
			
			
			<!-- 부서 별 미실시 수 그래프 (막대그래프) -->
			<section class="four">
		<div class="container">
			<label for="myChart2"><h3>□ 부서 별 미실시 수</h3>
				<br /></label>

			<div class="row">
				<!-- Bar Chart -->
				<canvas id="myChart2"></canvas>
				<script>
					var maxNum = "<c:out value="${maxNumBar}"/>";
					maxNum *= 1;
					var h_barOptions = {
						legend : {
							display : true,
							position : 'bottom'
						},
						scales : {
							xAxes : [ {
								ticks : {
									min : 0,
									max : maxNum,
									stepSize : 1
								}
							} ]
						}
					};
					var data_list = new Array();
					var name_list = new Array();
					<c:forEach items="${nameDept}" var="item">
					name_list.push("${item}");
					</c:forEach>
					<c:forEach items="${numNonImplement}" var="item">
					data_list.push("${item}");
					</c:forEach>
					var ctx = document.getElementById('myChart2').getContext(
							'2d');
					var myChart = new Chart(ctx, {
						type : 'horizontalBar',
						data : {
							labels : name_list,
							datasets : [ {
								label : '사무실 보안점검 미실시 수',
								data : data_list,
								backgroundColor : [ 'rgba(0, 99, 132, 0.6)',
										'rgba(30, 99, 132, 0.6)',
										'rgba(60, 99, 132, 0.6)',
										'rgba(90, 99, 132, 0.6)',
										'rgba(120, 99, 132, 0.6)',
										'rgba(150, 99, 132, 0.6)',
										'rgba(180, 99, 132, 0.6)',
										'rgba(210, 99, 132, 0.6)',
										'rgba(240, 99, 132, 0.6)',
										'rgba(270, 99, 132, 0.6)' ],
								borderColor : [ 'rgba(0, 99, 132, 1)',
										'rgba(30, 99, 132, 1)',
										'rgba(60, 99, 132, 1)',
										'rgba(90, 99, 132, 1)',
										'rgba(120, 99, 132, 1)',
										'rgba(150, 99, 132, 1)',
										'rgba(180, 99, 132, 1)',
										'rgba(210, 99, 132, 1)',
										'rgba(240, 99, 132, 1)',
										'rgba(270, 99, 132, 1)' ],
								borderWidth : 2,
								hoverBorderWidth : 0
							} ]
						},
						options : h_barOptions
					});
				</script>
			</div>
		</div>
	</section>
</div>
<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>