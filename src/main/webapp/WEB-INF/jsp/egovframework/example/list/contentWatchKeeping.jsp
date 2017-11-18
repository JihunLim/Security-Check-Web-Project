<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<%
	String context = request.getContextPath();
%>



<!-- Main -->
<div id="main">
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
						<input type="text" name="wk_mpd" style="color:#000;" value="경영지원본부  :  ${data.wk_mpd}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_vmd" style="color:#000;" value="바우처본부  :  ${data.wk_vmd}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_hmd" style="color:#000;" value="보건의료본부  :  ${data.wk_hmd}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_csd" style="color:#000;" value="고객지원본부  :  ${data.wk_csd}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_itd" style="color:#000;" value="정보기술본부  :  ${data.wk_itd}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_wio" style="color:#000;" value="복지정보운영본부  :  ${data.wk_wio}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_wim" style="color:#000;" value="복지정보관리본부  :  ${data.wk_wim}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_hwd" style="color:#000;" value="희망복지본부  :  ${data.wk_hwd}명 " readonly></input>
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_sii" style="color:#000;" value="사회보장정보연구소  :  ${data.wk_sii}명 " readonly></input>
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
				<input type="button" value="출력" onClick="print(document.getElementById('printarea').innerHTML);" style="float:right;">
				<input type="button" value="목록보기" onClick="history.back();" style="float:right;"> 
			</form>
			</div>		
		</div>
	</section>
	
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>