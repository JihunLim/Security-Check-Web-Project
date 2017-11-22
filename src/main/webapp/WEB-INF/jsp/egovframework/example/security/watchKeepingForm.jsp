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
			<form name="watchKeepingForm" method="post"
				action="<%=context%>/watchKeepingCheck.do"
				onsubmit="return checkNightForm()">

			
				<input type="hidden" name="wk_empemail"
					value=<s:authentication property="name"/>><br />

				<div class="controls">
					<textarea name="wk_indication" cols="40" rows="3" style="color:black;" readonly>${indication}</textarea>
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
						<input type="text" name="wk_mpd" placeholder="경영지원본부 근무자 현황 수" />
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_vmd" placeholder="바우처 본부 근무자 현황 수" />
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_hmd" placeholder="보건의료본부 근무자 현황 수" />
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_csd" placeholder="고객지원본부 근무자 현황 수" />
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_itd" placeholder="정보기술본부 근무자 현황 수" />
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_wio" placeholder="복지정보운영본부 근무자 현황 수" />
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_wim" placeholder="복지정보관리본부 근무자 현황 수" />
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_hwd" placeholder="희망복지본부 근무자 현황 수" />
					</div>
					<div class="6u$ 12u$(mobile)">
						<input type="text" name="wk_sii" placeholder="사회보장정보연구소 근무자 현황 수" />
					</div>

				</div><br /> 
			
				<div class="controls">
					<textarea
						placeholder="보고사항을 적어주세요(최대200자)" name="wk_specificity"
						 cols="40" rows="3"></textarea>
				</div>
				<br />

				<textarea placeholder="인계사항을 적어주세요(최대200자)" cols="40" rows="3" name="wk_report"></textarea>
				<br />
				<div class="controls">
				<div class="row">
				<div class="12u$ 12u$(mobile)">
					<span class="icon fa-camera" style="float:left"> 사진 첨부(파일선택을 눌러 사진을 찍어주세요)</span><br /></div>
					<div class="12u$ 12u$(mobile)">
					<input type="file" accept="image/*" capture="camera" name="" style="float:left;"> </div>
				</div>
				</div>
				<br /> <br /> <br /> <br /> 
				<input type="submit" value="제출하기" />
			</form>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>