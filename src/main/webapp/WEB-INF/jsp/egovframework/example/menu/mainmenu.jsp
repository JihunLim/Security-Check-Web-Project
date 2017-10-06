<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%String cp= request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,initial-scale="1">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.min.css" />
<title>Insert title here</title>
<nav class="navbar navbar-fixed-top navbar-inverse">
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="mainmenu.do">O.S.M.S</a>
	</div>

	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">

			<li><p class="navbar-text"><span class="glyphicon glyphicon-user"></span>${deptName} ${emp_name} (${auth})님
					안녕하세요.</p></li>
			<li><a
				href="${pageContext.request.contextPath}/j_spring_security_logout">
				<span class="glyphicon-log-out"></span>Log Out</a></li>
		</ul>
	</div>
	<!-- /.nav-collapse -->
</div>
</nav>


</head>
<body style="padding: 100px">

	<!-- 로그인 정보 출력 -->
	<!--  USER ID : <s:authentication property="name"/><br/>
	<a href = "${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a>
	-->

	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9 col-sm-push-3">
				<button type="button" class="pull-left btn btn-default visible-xs"
					data-toggle="offcanvas" aria-expanded="false"
					aria-controls="navbar">
					<i class="fa fa-navicon"></i>
				</button>
				<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p>세영테스트.</p>
				</div>
				<div class="row">
					<div class="col-xs-6 col-lg-4">
						<h2>Heading</h2>
						<p>세영테스트</p>
						<p>
							<a class="btn btn-default" href="#" role="button">View
								details &raquo;</a>
						</p>
					</div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-xs-6 col-lg-4">
						<h2>Heading</h2>
						<p>세영</p>
						<p>
							<a class="btn btn-default" href="#" role="button">View
								details &raquo;</a>
						</p>
					</div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-xs-6 col-lg-4">
						<h2>Heading</h2>
						<p>세영</p>
						<p>
							<a class="btn btn-default" href="#" role="button">View
								details &raquo;</a>
						</p>
					</div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-xs-6 col-lg-4">
						<h2>Heading</h2>
						<p>세영</p>
						<p>
							<a class="btn btn-default" href="#" role="button">View
								details &raquo;</a>
						</p>
					</div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-xs-6 col-lg-4">
						<h2>Heading</h2>
						<p>세영</p>
						<p>
							<a class="btn btn-default" href="#" role="button">View
								details &raquo;</a>
						</p>
					</div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-xs-6 col-lg-4">
						<h2>Heading</h2>
						<p>셍ㅇ</p>
						<p>
							<a class="btn btn-default" href="#" role="button">View
								details &raquo;</a>
						</p>
					</div>
					<!--/.col-xs-6.col-lg-4-->
				</div>
				<!--/row-->
			</div>
			<!--/.col-xs-12.col-sm-9-->

			<div class="col-xs-6 col-sm-3 col-sm-pull-9 sidebar-offcanvas"
				id="sidebar">
				<div class="list-group">
					<ul class="list-group">
						<a href="officeSecurityChoice.do" class="list-group-item"><span
							class="badge">12</span>사무실 보안점검 작성(당직자용 남음)</a>
						<a href="watchKeepingForm.do" class="list-group-item"><span
							class="badge">5</span>당직 근무일지 작성</a>
						<a href="listOfficeSecurity.do" class="list-group-item"><span
							class="badge">3</span>보안 점검 조회</a>
						<a href="listWatchKeeping.do" class="list-group-item"><span
							class="badge"></span>당직 근무일지 조회</a>
						<a href="smartSecuritySolution.do" class="list-group-item"><span
							class="badge">7</span>SMART 보안 솔루션(미완성)</a>
						<a href="#" class="list-group-item"><span class="badge"></span>당직
							근무표(미완성)</a>
						<a href="updateDept.do" class="list-group-item"><span
							class="badge"></span>부서 업데이트</a>
						<a href="updateManager.do" class="list-group-item"><span
							class="badge">1</span>보안 담당자 변경</a>
					</ul>


				</div>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->

		<hr>

	</div>
	<!--/.container-->
	<!--  
	<h1>사용자 메뉴</h1>
	
	<h2>일일 보안점검</h2>
	<a href="officeSecurityChoice.do">사무실 보안점검 작성(당직자용 남음)</a><br /><br />
	<a href="watchKeepingForm.do">당직근무일지 작성 </a><br /><br />
	
	<h2>보안 점검조회</h2>
	<a href="listOfficeSecurity.do">보안점검 조회</a><br /><br />
	<a href="listWatchKeeping.do">당직근무일지 조회 </a><br /><br />
	<a href="#">S.M.A.R.T 보안솔루션 (미완성)</a><br /><br />
	
	<h2><a href="#">당직 근무표(미완성)</a></h2><br /><br />
	
	<h1>관리자 메뉴</h1>
	
	<a href="updateDept.do">부서 업데이트</a><br /><br />
	<a href="#">당직자 변경</a><br /><br />
	<a href="#">보안담당자 변경</a><br /><br />
	-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
</body>
</html>