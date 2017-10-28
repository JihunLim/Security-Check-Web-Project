<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%String cp= request.getContextPath(); %>
<!DOCTYPE HTML>

<html>
	<head>
		<title>사회보장정보원 보안시스템</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="<%=cp%>/bootstrap/css/main.css" />
		
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
	
	</head>
	<body>
		
		<!-- Header -->
			<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="images/avatar.jpg" alt="avarta" /></span>
							<h1 id="title">${emp_name}</h1>
							<p>${deptName} (${auth})</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="mainmenu.do" class="skel-layers-ignoreHref"><span class="icon fa-home">Home</span></a></li>
								<li><a href="officeSecurityChoice.do" class="skel-layers-ignoreHref"><span class="icon fa-pencil-square-o">사무실 보안점검 작성</span></a></li>
								<li><a href="watchKeepingForm.do" class="skel-layers-ignoreHref"><span class="icon fa-pencil-square">당직 근무일지 작성</span></a></li>
								
								<li><a href="listOfficeSecurity.do?page=1" class="skel-layers-ignoreHref"><span class="icon fa-list">보안 점검 조회</span></a></li>
								<li><a href="listWatchKeeping.do?page=1" class="skel-layers-ignoreHref"><span class="icon fa-list">당직 근무일지 조회</span></a></li>
								<li><a href="smartSecuritySolution.do" class="skel-layers-ignoreHref"><span class="icon fa-pie-chart">S.M.A.R.T 보안 솔루션</span></a></li>
								
								<li><a href="nightDutyTable.do" class="skel-layers-ignoreHref"><span class="icon fa-calendar-check-o">당직근무표</span></a></li>
								
								<s:authorize access="hasAuthority('ROLE_ADMIN')">
									<li><a href="updateDept.do" class="skel-layers-ignoreHref"><span class="icon fa-cog">부서 업데이트</span></a></li>
									<li><a href="updateManager.do" class="skel-layers-ignoreHref"><span class="icon fa-th">보안 담당자 변경</span></a></li>
								</s:authorize>
							</ul>
						</nav>

				</div>

				<div class="bottom">

					<!-- Social Icons -->
					<div class="icons">
						<a href="${pageContext.request.contextPath}/j_spring_security_logout"> <span class="icon fa-sign-out"></span>Log Out</a>
					</div> 
				</div>

			</div>