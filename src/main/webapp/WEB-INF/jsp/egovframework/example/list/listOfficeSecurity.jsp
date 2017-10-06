<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>   
<%String cp= request.getContextPath(); %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>

	<!-- 상단 메뉴 바 고정 -->
	<nav class="navbar navbar-inverse">
  		<div class="container-fluid" role="form">
  		
    		<div class="col-md-3">
     	 		<a class="navbar-brand" href="#">Office Security Management System</a>
    		</div>
    		<div class="col-md-6">
    		<ul class="nav navbar-nav">
      		<li><a color:#FFFFF> ${deptName}  ${emp_name} (${auth})님 안녕하세요. <br/></li>
    		</ul>
    		</div>
    		<ul class="nav navbar-nav navbar-right">
      		<li><a href="${pageContext.request.contextPath}/j_spring_security_logout"><span class="glyphicon glyphicon-log-in"></span>Log Out</a></li>
    		</ul>
  		</div>
	</nav>
	
	<!-- 테이블 출력  -->
	<div class="container">
		<h2>보안 점검 조회</h2>
		<table class="table table-hover">
			<thead>
			<tr>
				<th>일시</th>
				<th>이메일</th>
				<th>부서</th>
				<th>문서</th>
				<th>청소</th>
				<th>소등</th>
				<th>환기</th>
				<th>문단속</th>
				<th>비고</th>
			</tr>
			</thead>
			<c:forEach items="${list}" var="dto">
				<tbody>
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
				</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	
	<!-- 페이지 설정 -->
	<div class = "container">
		<ul class="pagination">
			<li class="disabled"><a href="#">&laquo;</a></li>
    		<li class="active"><a href="#">1</a></li> <!-- 초기 페이지 설정 -->
    		<li><a href="#">2</a></li>
    		<li><a href="#">3</a></li>
    		<li><a href="#">4</a></li>
    		<li><a href="#">5</a></li>
    		<li ><a href="#">&raquo;</a></li>
  		</ul>
	</div>
	
</body>
</html>