<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp" %>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuStart.jsp" %>
	<!-- 시작 -->
	<h1>안쓰는 페이지 - 추후에 삭제</h1>
	<%
		String context = request.getContextPath();
	%>
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
				
				
	<!-- 끝 -->
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuEnd.jsp" %>