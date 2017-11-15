<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%String cp= request.getContextPath(); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.css"/>
<title>Insert title here</title>
<style type="text/css">
	body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
	#center { position:absolute; top:50%; left:50%; width:300px; height:500px; overflow:hidden; margin-top:-200px; margin-left:-150px;}
</style>
</head>
<body>

	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="main.jsp">Office Security Management System</a>
		</div>
	</nav>
	
	
			
			<div id="center">
				<div class="jumbotron" style="background-color: #ffffff;">
						<c:url value="j_spring_security_check" var="loginUrl"/>
						<form action="${loginUrl}" method="post">
						
						<h2 style="text-align: center;"><a href="#"><img src="images/login_ssis.PNG" alt="사회보장정보원" /></a></h2>
						<c:if test="${param.fail == null}">
						<h5 style="text-align: center;color:#1E90FF;">로그인 후에 이용하실 수 있습니다.</h5>
						</c:if>
						<c:if test="${param.fail != null}">
							<h5 style="text-align: center;color:#CD1039;"><strong>아이디 또는 비밀번호가 잘못되었습니다.</strong></h5>
						</c:if>
						<div class="form-group">
							<p><input type="text" class="form-control" placeholder="아이디" name="j_username" id="j_username" size="20" style="height:30px;" required autofocus></p>
							<p><input type="password" class="form-control" placeholder="비밀번호" name="j_password" id="j_password" required></p>
						</div>
						<input type="submit" class="btn btn-primary form-control" value="로그인">
						<!--  ID : <input type="text" name="j_username" id="j_username"><br/>
						PW : <input type="password" name="j_password" id="j_password"><br/>
						 <input type="submit" value="전송"><br/>-->
						</form>
	
				</div>
			
		</div>
	
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
</body>
</html>