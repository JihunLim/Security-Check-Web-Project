<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<%
	String context = request.getContextPath();
%>

<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section id="top" class="one dark">
		<div class="container">

			<header>
				<h2>관리자 추가하기</h2>
			</header>
		</div>
	</section>
	<section class="white">
		<div class="container">
			<form name="addManagerForm" method="post"
				action="<%=context%>/addManagerCheck.do">
				<table cellpadding="0" cellspacing="0" border="1">
					<tr>
						<td>선택</td>
						<td>이메일</td>
						<td>이름</td>
						<td>부서</td>
						<td>전화번호</td>
					<tr>
						<!-- c: 사용하려면 꼭 taglib 써줘야 함 -->
						<c:forEach items="${list}" var="dto">
							<tr>
								<td><input type="checkbox" name="emp_emails"
									value="${dto.emp_email}"></td>
								<td>${dto.emp_email}</td>
								<td>${dto.emp_name}</td>
								<td>${dto.deptName}</td>
								<td>${dto.emp_phone}</td>
							<tr>
						</c:forEach>
				</table>
				<input type="submit" value="권한 추가하기" />
			</form>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>