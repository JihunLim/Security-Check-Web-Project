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
				<h2>
					<strong>당직점검일지</strong>
				</h2>
			</header>
		</div>
	</section>
			
		<section class="white">
		<div class="container">
		<div id="printarea">
		<form >
				<div class="controls">
				<label style="float:left;">1. 지시사항</label> <br />
					<textarea name="wk_indication"  style="color:#000;" readonly>${data.wk_indication}</textarea>
				</div>
				<br />
				<label style="float:left;">2. 조치사항</label> <br />
				<div class="controls">
					<textarea style="color:#000;" readonly>${data.wk_measure}</textarea>
				</div>
				<br />
				<label style="float:left;">3. 각 부서 근무자 현황 수</label>
				<div class="row">
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp1" style="color:#000;" value="경영지원본부  :  ${data.wk_dp1}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp2" style="color:#000;" value="바우처본부  :  ${data.wk_dp2}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp3" style="color:#000;" value="보건의료본부  :  ${data.wk_dp3}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp4" style="color:#000;" value="고객지원본부  :  ${data.wk_dp4}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp5" style="color:#000;" value="정보기술본부  :  ${data.wk_dp5}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp6" style="color:#000;" value="복지정보운영본부  :  ${data.wk_dp6}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp7" style="color:#000;" value="복지정보관리본부  :  ${data.wk_dp7}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp8" style="color:#000;" value="희망복지본부  :  ${data.wk_dp8}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp9" style="color:#000;" value="사회보장정보연구소  :  ${data.wk_dp9}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp10" style="color:#000;" value="사회보장정보연구소  :  ${data.wk_dp10}명 " readonly></input>
					</div>
				</div><br /> 


				<div class="controls">
				<label style="float:left;">4. 당직근무 간 보고사항</label>
					<textarea name="wk_specificity" style="color:#000;" readonly>${data.wk_specificity}</textarea>
				</div>
				<br />
				<label style="float:left;">5. 당직근무 간 인계사항</label>
				<textarea name="wk_report" style="color:#000;" readonly>${data.wk_report}</textarea>
				<br /> 
				<input type="button" value="목록보기" onClick="history.back();" style="float:right;"> 
			</form>
			</div>		
		</div>
	</section>
	
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>