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
	<h1> 관리자 목록 페이지</h1>
	<table  cellpadding="0" cellspacing="0" border="1">
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
			<td><a href="deleteManagerCheck.do?emp_email=${dto.emp_email}">X</a></td>
		<tr>
		</c:forEach>
	</table>
	<p><a href="addManagerForm.do">관리자 추가</a></p>
</body>
</html>