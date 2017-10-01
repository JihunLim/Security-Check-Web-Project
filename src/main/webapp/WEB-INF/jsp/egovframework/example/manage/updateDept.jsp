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
	<p><a href="addDeptForm.do">부서 추가</a></p>
</body>
</html>