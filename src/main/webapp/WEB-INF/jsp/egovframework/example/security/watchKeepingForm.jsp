<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<%String context = request.getContextPath();%>

<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section class="white">
		<div class="container">

			<header>
				<h2>당직점검일지</h2>
			</header>
			<form name="watchKeepingForm" method="post"
				action="<%=context%>/watchKeepingCheck.do"
				onsubmit="return checkForm()">

				<!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->

				<input type="hidden" name="wk_empemail"
					value=<s:authentication property="name"/>><br /> <br />
				지시사항 <br />
				<textarea rows="5" cols="30" name="wk_indication"></textarea>
				<br /> <br /> 조치사항<br />
				<textarea rows="5" cols="30" name="wk_measure"></textarea>
				<br /> <br /> 순찰 중 각 부서 근무자 현황<br /> 경영지원본부 : <input
					type="number" name="wk_mpd" value="" /><br /> 바우처본부 : <input
					type="number" name="wk_vmd" value="" /><br /> 보건의료본부 : <input
					type="number" name="wk_hmd" value="" /><br /> 고객지원본부 : <input
					type="number" name="wk_csd" value="" /><br /> 정보기술본부 : <input
					type="number" name="wk_itd" value="" /><br /> 복지정보운영본부 : <input
					type="number" name="wk_wio" value="" /><br /> 복지정보관리본부 : <input
					type="number" name="wk_wim" value="" /><br /> 희망복지본부 : <input
					type="number" name="wk_hwd" value="" /><br /> 사회보장정보연구소 : <input
					type="number" name="wk_sii" value="" /><br /> <br /> 당직 중 특이사항<br />
				<textarea rows="5" cols="30" name="wk_specificity"></textarea>
				<br /> <br /> 보고사항<br />
				<textarea rows="5" cols="30" name="wk_report"></textarea>
				<br /> <br /> 인계사항<br />
				<textarea rows="5" cols="30" name="wk_delivery"></textarea>
				<br /> <br /> 시간 : 서버시간 가져오기 (서버쪽에서)<br /> <br /> <input
					type="submit" value="확인(submit)" /> <input type="reset" value="취소" />
			</form>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>