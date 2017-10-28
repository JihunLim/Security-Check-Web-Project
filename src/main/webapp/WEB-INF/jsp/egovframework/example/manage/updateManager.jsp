<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>


<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section class="white">
		<div class="container">

			<header>
				<h2>보안 담당자 관리</h2>
			</header>

			<table class="table">
				<tr>
					<td>이메일</td>
					<td>이름</td>
					<td>부서</td>
					<td>전화번호</td>
					<td>권한 삭제</td>
				<tr>
					<!-- c: 사용하려면 꼭 taglib 써줘야 함 -->
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.emp_email}</td>
							<td>${dto.emp_name}</td>
							<td>${dto.deptName}</td>
							<td>${dto.emp_phone}</td>
							<td><a
								href="deleteManagerCheck.do?emp_email=${dto.emp_email}">X</a></td>
						<tr>
					</c:forEach>
			</table>
			<p>
				<a href="addManagerForm.do">관리자 추가</a>
			</p>
		</div>
	</section>
</div>




<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
