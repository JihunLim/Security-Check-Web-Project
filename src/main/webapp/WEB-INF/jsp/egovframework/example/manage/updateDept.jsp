<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp" %>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuStart.jsp" %>
	<!-- 시작 -->
	<table width="500" cellpadding="0" cellspacing="0" border="1">
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
	<p>
		<a href="addDeptForm.do">부서 추가</a>
	</p>
				
				
	<!-- 끝 -->
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuEnd.jsp" %>