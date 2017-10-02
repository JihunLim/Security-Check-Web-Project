<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String cp= request.getContextPath(); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.css"/>
<title>Insert title here</title>
</head>
<body>

	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			
			</button>
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			
			</button>
			<a class="navbar-brand" href="main.jsp">Office Security Management System</a>
		</div>
		
	</nav>
	<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top:20px;">
						<c:url value="j_spring_security_check" var="loginUrl"/>
						<form action="${loginUrl}" method="post">
						<c:if test="${param.fail != null}">
							<p>
								Login Fail! <br/>
						<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != NULL}">
						message : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
						</c:if>
							</p>
						</c:if>
						<h3 style="text-align: center;">로그인 화면</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디" name="j_username" id="j_username">
							<input type="password" class="form-control" placeholder="비밀번호" name="j_password" id="j_password">
						</div>
						<input type="submit" class="btn btn-primary form-control" value="전송">
						<!--  ID : <input type="text" name="j_username" id="j_username"><br/>
						PW : <input type="password" name="j_password" id="j_password"><br/>
						 <input type="submit" value="전송"><br/>-->
						</form>
	
				</div>
			<div class="col-lg-4"></div>
		</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
</body>
</html>