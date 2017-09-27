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
ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>부서이름</td>
		<tr>
		<!-- c: 사용하려면 꼭 taglib 써줘야 함 -->
		<c:forEach items="${list}" var="dto"> 
		<tr>
			<td>${dto.deptNo}</td>
			<td>${dto.deptName}</td>
			<td><a href="delete?mId=${dto.deptNo}">X</a></td>
		<tr>
		</c:forEach>
	</table>
	<p><a href="#">관리자 추가</a></p>
</body>
</html>