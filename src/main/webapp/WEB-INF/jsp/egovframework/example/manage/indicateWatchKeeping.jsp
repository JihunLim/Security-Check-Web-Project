<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>


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
				<h2>당직근무 지시사항</h2>
			</header>
		</div>
	</section>

	<section class="white">
		<div class="container">
			<form method="post" action="<%=cp%>/indicateWatchKeeping.do">
				<input type="hidden" name="wk_empemail" value=<s:authentication property="name"/>><br />
				
				<label style="float:left;"><span class="icon fa-paper-plane" style="color:#BDB76B;"><strong style="color:#483D8B;"> ${today}</strong></span> 당직근무 지시자항 작성하기</label>
				<div class="controls">
					<textarea name="wk_indication" cols="40" rows="3" >${indication}</textarea>
				</div>
				
				<footer>
				<button type="submit" class="btn btn-primary" style="float:right;">저장</button>
				</footer>
			</form>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
