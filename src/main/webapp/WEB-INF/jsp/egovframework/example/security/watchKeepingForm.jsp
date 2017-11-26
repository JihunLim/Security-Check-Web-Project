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
			<form name="watchKeepingForm" method="post"
				action="<%=context%>/watchKeepingCheck.do"
				onsubmit="return checkNightForm()">

			
				<input type="hidden" name="wk_empemail"
					value=<s:authentication property="name"/>><br />

				<div class="controls">
					<textarea name="wk_indication" cols="40" rows="3" style="color:black;" placeholder="조치사항이 없습니다." readonly>${indication}</textarea>
				</div>

				<br />

				<div class="controls">
					<textarea 
						placeholder="조치 사항을 적어주세요.(최대 200자)" name="wk_measure"
						cols="40" rows="3"></textarea>
				</div>

				<br />
				<div class="row">

					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp1" placeholder="경영기획본부 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp2" placeholder="정보기술본부 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp3" placeholder="고객지원본부 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp4" placeholder="정보개발본부 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp5" placeholder="복지정보본부 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp6" placeholder="보건의료본부 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp7" placeholder="희망복지중앙지원단 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp8" placeholder="바우처관리본부 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp9" placeholder="바우처정보본부 근무자 현황 수" required/>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_dp10" placeholder="사회보장정보연구소 근무자 현황 수" required/>
					</div>

				</div><br /> 
			
				<div class="controls">
					<textarea
						placeholder="당직 중 특이사항 및 처리결과를 적어주세요(최대200자)" name="wk_specificity"
						 cols="40" rows="3"></textarea>
				</div>
				<br />

				<textarea placeholder="보고사항을 적어주세요(최대200자)" cols="40" rows="3" name="wk_report"></textarea>
				<br />
				<textarea placeholder="인계사항을 적어주세요(최대200자)" cols="40" rows="3" name="wk_report"></textarea>
				<br />
			
				<br /> <br /> 
				<input type="submit" value="제출하기" />
			</form>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>