<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%String cp= request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,initial-scale="1">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.min.css" />
<title>사회보장정보원 보안시스템</title>
<script type="text/javascript">
        //submit
        function checkForm() {
               //값에 대한 검사 : 브라우저 내부에서...
               if(document.watchKeepingForm.name.value == ""){
                       alert("부서이름이 없습니다.");
                       return false;          //onsubmit의 경우 return false를 줘야지 전달을 하지 않음!
               }       
        }
	</script>

<!-- 시작 : 윗 부분 상단 바 -->
<nav class="navbar navbar-fixed-top navbar-inverse">
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="mainmenu.do">O.S.M.S</a>
	</div>

	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">

			<li><p class="navbar-text">
					<span class="glyphicon glyphicon-user"></span>${deptName} ${emp_name} (${auth})님 안녕하세요.
				</p></li>
			<li><a
				href="${pageContext.request.contextPath}/j_spring_security_logout">
					<span class="glyphicon-log-out"></span>Log Out
			</a></li>
		</ul>
	</div>
	<!-- /.nav-collapse -->
</div>
</nav>
<!-- 끝 : 윗 부분 상단 바 -->
</head>