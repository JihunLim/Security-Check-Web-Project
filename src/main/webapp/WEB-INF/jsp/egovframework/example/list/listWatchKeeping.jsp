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
<title>사회보장정보원 보안시스템</title>

<!-- 시작 : 윗 부분 상단 바 -->
<nav class="navbar navbar-fixed-top navbar-inverse">
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="mainmenu.do">O.S.M.S</a>
	</div>

	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">

			<li><p class="navbar-text">
					<span class="glyphicon glyphicon-user"></span>${deptName}
					${emp_name} (${auth})님 안녕하세요.
				</p></li>
			<li><a
				href="${pageContext.request.contextPath}/j_spring_security_logout">
					<span class="glyphicon-log-out"></span>Log Out
			</a></li>
		</ul>
	</div>
	<!-- /.nav-collapse -->
</div>
</nav>
<!-- 끝 : 윗 부분 상단 바 -->
</head>

<!-- 시작 : body 태그 시작 -->
<body style="padding: 60px 0px 0px 0px">

	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9 col-sm-push-2">
				<button type="button" class="pull-left btn btn-default visible-xs"
					data-toggle="offcanvas" aria-expanded="false"
					aria-controls="navbar">
					<i class="fa fa-navicon"></i>
				</button>

				<!-- 시작 : 본 내용 위치 -->
				
				<h2>당직 근무일지 조회</h2>
				<p>추후에 employee 테이블과 watchkeeping 테이블과 dept 테이블 조인시켜서 이메일 대신
					회원부서와 이름 가져오기</p>

				<div class="container">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>일시</th>
								<th>이메일</th>
								<th>지시받은사항</th>
								<th>조치사항</th>
								<th>경영기획본부 근무자 현황</th>
								<th>바우처본부 근무자 현황</th>
								<th>보건의료본부 근무자 현황</th>
								<th>고객지원본부 근무자 현황</th>
								<th>정보기술본부 근무자 현황</th>
								<td>복지정보운영본부 근무자 현황</th>
					<td>복지정보관리본부 근무자 현황
								</th>
					<th>희망복지본부 근무자 현황</th>
					<th>사회보장정보연구소 근무자 현황</th>
					<th>당직중 특이사항</th>
					<th>보고사항</th>
					<th>인계사항</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="dto">
			<tbody>
				<tr>
					<td>${dto.wk_datetime}</td>
					<td>${dto.wk_empemail}</td>
					<td>${dto.wk_indication}</td>
					<td>${dto.wk_measure}</td>
					<td>${dto.wk_mpd}</td>
					<td>${dto.wk_vmd}</td>
					<td>${dto.wk_hmd}</td>
					<td>${dto.wk_csd}</td>
					<td>${dto.wk_itd}</td>
					<td>${dto.wk_wio}</td>
					<td>${dto.wk_wim}</td>
					<td>${dto.wk_hwd}</td>
					<td>${dto.wk_sii}</td>
					<td>${dto.wk_specificity}</td>
					<td>${dto.wk_report}</td>
					<td>${dto.wk_delivery}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
	
	<!-- 페이지 설정 -->
	<div class="container">
		<ul class="pagination">
			<li class="disabled"><a href="#">&laquo;</a></li>
    		<li class="active"><a href="#">1</a></li> <!-- 초기 페이지 설정 -->
    		<li><a href="#">2</a></li>
    		<li><a href="#">3</a></li>
    		<li><a href="#">4</a></li>
    		<li><a href="#">5</a></li>
    		<li><a href="#">&raquo;</a></li>
  		</ul>
	</div>
				
				<!-- 끝 : 본 내용 위치 -->
			</div>
			<!--/.col-xs-12.col-sm-9-->


			<!-- 시작 : 왼쪽 메뉴 -->
			<div class="col-xs-3 col-sm-2 col-sm-pull-9 sidebar-offcanvas"
				id="sidebar">
				<div class="list-group">
					<ul class="list-group">
						<a href="officeSecurityChoice.do" class="list-group-item">사무실
							보안점검 작성(당직자용 남음)</a>
						<a href="watchKeepingForm.do" class="list-group-item">당직 근무일지
							작성</a>
						<a href="listOfficeSecurity.do" class="list-group-item">보안 점검
							조회</a>
						<a href="listWatchKeeping.do" class="list-group-item">당직 근무일지
							조회</a>
						<a href="smartSecuritySolution.do" class="list-group-item">SMART
							보안 솔루션(미완성)</a>
						<a href="#" class="list-group-item"><span class="badge"></span>당직근무표(미완성)</a>
						<s:authorize access="hasAuthority('ROLE_ADMIN')">
							<a href="updateDept.do" class="list-group-item">부서 업데이트</a>
							<a href="updateManager.do" class="list-group-item">보안 담당자 변경</a>
						</s:authorize>

					</ul>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
			<!-- 시작 : 왼쪽 메뉴 -->

		</div>
		<!--/row-->
		<hr>
	</div>
	<!--/.container-->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
</body>
<!-- 끝 : body 태그 시작 -->
</html>