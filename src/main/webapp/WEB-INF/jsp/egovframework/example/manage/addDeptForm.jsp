<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<%
	String context = request.getContextPath();
%>

<!-- Main -->
<div id="main">
	<div class = "main_page"		style="margin:0;">
		<a href="mainmenu.do"><img src= "images/home_logo.PNG" style="float:left; margin:10px 10px -15px 10px; padding-left:20px;"></a>
		<img src= "images/line.png" style="width:100%; height:5px; margin:0px;">
	</div>
	<!-- Intro -->
	<section id="top" class="one dark">
		<div class="container">

			<header>
				<h2>부서추가</h2>
			</header>
		</div>
	</section>

	<section class="white">
		<div class="container">
			<form name="addDeptForm" method="post"
				action="<%=context%>/addDeptCheck.do" onsubmit="return checkForm()">
				<!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->
				추가하려는 부서를 적으세요 : <input type="text" name="deptName"><br />

				<input type="submit" value="확인" /> <input type="reset" value="취소" />
			</form>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>