<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<%
	String context = request.getContextPath();
%>

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
				<h2>안쓰는 페이지 - 추후에 삭제</h2>
			</header>
		</div>
	</section>

	<section class="white">
		<div class="container">
			<form name="updateWatchKeeper" method="post"
				action="<%=context%>/changeWatchKeeperCheck.do">
				<table cellpadding="0" cellspacing="0" border="1">
					<tr>
						<td>이메일</td>
						<td>이름</td>
						<td>부서</td>
						<td>전화번호</td>
						<td>당직여부</td>
					<tr>
						<!-- c: 사용하려면 꼭 taglib 써줘야 함 -->
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.emp_email}</td>
								<td>${dto.emp_name}</td>
								<td>${dto.deptName}</td>
								<td>${dto.emp_phone}</td>
								<td><input type="radio" name="emp_watchkeeping"
									value="${dto.emp_email}"
									<c:if test="${dto.emp_watchkeeping eq 'y'}"> checked </c:if>></td>
							<tr>
						</c:forEach>
				</table>
				<input type="submit" value="당직자 변경" />
			</form>



		</div>
	</section>
</div>
<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>