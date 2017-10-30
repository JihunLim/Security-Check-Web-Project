<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>


<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section id="top" class="one dark cover">
		<div class="container">

			<header>
				<h2>부서 업데이트</h2>
			</header>
		</div>
	</section>

	<section class="white">
		<div class="container">
			<table class="table table-hover">
				<tr>
					<td>부서이름</td>
					<td>삭제</td>
				<tr>
					<!-- c: 사용하려면 꼭 taglib 써줘야 함 -->
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.deptName}</td>
							<td><a href="deleteDeptCheck.do?deptId=${dto.deptNo}">X</a></td>
						<tr>
					</c:forEach>
			</table>
			<footer>
				<a href="addDeptForm.do" class="button scrolly">부서 추가</a>
			</footer>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
