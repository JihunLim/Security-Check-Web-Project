<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp" %>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuStart.jsp" %>
	<!-- 시작 -->
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="mainmenu.do">O.S.M.S</a>
			</div>
	
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
		
					<li><p class="navbar-text">
							<span class="glyphicon glyphicon-user"></span>${deptName}
							${emp_name} (${auth})님 안녕하세요.
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
				
				
	<!-- 끝 -->
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuEnd.jsp" %>