<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>


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
				<h2>보안 담당자 관리</h2>
			</header>
		</div>
	</section>
	<section class="white">
		<div class="container">
			<table class="table">
				<tr>
					<td>이메일</td>
					<td>이름</td>
					<td>부서</td>
					<td>전화번호</td>
					<td>이메일 수신</td>
					<td>권한 삭제</td>
				<tr>
					<!-- c: 사용하려면 꼭 taglib 써줘야 함 -->
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.emp_email}</td>
							<td>${dto.emp_name}</td>
							<td>${dto.deptName}</td>
							<td>${dto.emp_phone}</td>
							<td><a href="changeManagerEmailCheck.do?emp_email=${dto.emp_email}&check=${dto.emp_checkemail}" title="이메일 수신 변경하기">${dto.emp_checkemail}</a></td>
							<td><a href="deleteManagerCheck.do?emp_email=${dto.emp_email}" title="권한 삭제하기">X</a></td>
						<tr>
					</c:forEach>
			</table>

			<footer>
				<a href="addManagerForm.do?page=1" class="button scrolly">관리자 추가</a>
			</footer>


		</div>
	</section>
</div>




<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
