<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<%String context = request.getContextPath();%>

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
						<strong>사무실 보안점검일지 작성</strong> (최종퇴실자 용)
					</h2>
				</header>
			</div>
		</section>
	
		<section class="white">
			<div class="container">			
			<form class="form-horizontal" name="officeSecurityForm" method="post"
				action="<%=context%>/officeSecurityCheck.do"
				onsubmit="return checkOfficeForm()" enctype="multipart/form-data">

				<input type="hidden" name="os_empemail"
					value=<s:authentication property="name"/>><br />

				<div class="form-group">
					<label class="control-label col-sm-2" for="os_document">1. 서류보관상태
					</label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2">
						<input type="radio" name="os_document" value="0" <c:if test="${checkData[0] == 0}"> checked </c:if>>미흡</label> <label class="control-label col-sm-2">
						<input type="radio" name="os_document" value="1" <c:if test="${checkData[0] == 1}"> checked </c:if>>보통</label> <label class="control-label col-sm-2">
						<input type="radio" name="os_document" value="2" <c:if test="${checkData[0] == 2}"> checked </c:if>>양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="os_clean">2. 청소상태
					</label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_clean" value="0" <c:if test="${checkData[1] == 0}"> checked </c:if>>미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_clean" value="1" <c:if test="${checkData[1] == 1}"> checked </c:if>>보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_clean" value="2" <c:if test="${checkData[1] == 2}"> checked </c:if>>양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="os_lightout">3. 소등상태
					</label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_lightout" value="0" <c:if test="${checkData[2] == 0}"> checked </c:if>>미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_lightout" value="1" <c:if test="${checkData[2] == 1}"> checked </c:if>>보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_lightout" value="2" <c:if test="${checkData[2] == 2}"> checked </c:if>>양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="os_ventilation">4. 환기상태
					</label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_ventilation" value="0" <c:if test="${checkData[3] == 0}"> checked </c:if>>미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_ventilation" value="1" <c:if test="${checkData[3] == 1}"> checked </c:if>>보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_ventilation" value="2" <c:if test="${checkData[3] == 2}"> checked </c:if>>양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="os_door">5. 문단속 </label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_door" value="0" <c:if test="${checkData[4] == 0}"> checked </c:if>>미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_door" value="1" <c:if test="${checkData[4] == 1}"> checked </c:if>>보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_door" value="2" <c:if test="${checkData[4] == 2}"> checked </c:if>>양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="comment">6. 기타사항</label>
					<div class="col-sm-5">
						<textarea class="form-control" rows="5" name="os_etc" placeholder="기타사항을 입력하세요.(최대 200자)">${etc}</textarea>
						<br />
						<br />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="fileInput"><span class="icon fa-camera">사진 첨부</span><br />
					<input type="file" accept="image/*" capture="camera" name="os_image"> </label>
				</div>
				<div class="form-group">
					<br />
					<input type="submit" value="제출하기" />
				</div>
			</form>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>