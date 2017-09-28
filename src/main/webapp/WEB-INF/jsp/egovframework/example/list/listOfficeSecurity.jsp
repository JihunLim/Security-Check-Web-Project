<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>일시</td>
		<td>이메일</td>
		<td>부서</td>
		<td>문서</td>
		<td>청소</td>
		<td>소등</td>
		<td>환기</td>
		<td>문단속</td>
		<td>비고</td>
		
	<tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.os_datetime}</td>
		<td>${dto.os_empemail}</td>
		<td>${dto.os_deptcode}</td>
		<td>${dto.os_document}</td>
		<td>${dto.os_clean}</td>
		<td>${dto.os_lightout}</td>
		<td>${dto.os_ventilation}</td>
		<td>${dto.os_door}</td>
		<td>${dto.os_etc}</td>
		
	<tr>
	</c:forEach>
</table>

</body>
</html>