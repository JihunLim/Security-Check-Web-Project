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
					<strong>사무실 보안점검일지 작성</strong> (당직자 용)
				</h2>
			</header>
		</div>
	</section>

	<section class="white">
		<div class="container">
			<form name="osff" method="post"
				action="<%=context%>/officeSecurityFNCheck.do"
				onsubmit="return checkOSFForm()" enctype="multipart/form-data">

				<div class="row">
					<div class="2u 12u$(mobile)">
						<label class="control-label" for="select01">1. 점검부서</label>
					</div>
					<div class="4u$ 12u$(mobile)">
						<input type="hidden" name="os_empemail"
							value=<s:authentication property="name"/> />
						<div class="controls">
							<select name="os_deptcode" class="dropdown" onchange="changeValue(this.value)">
								<option value="0">부서를 선택하세요.</option>
								<option value="1">경영기획본부</option>
								<option value="2">정보기술본부</option>
								<option value="3">고객지원본부</option>
								<option value="4">정보개발본부</option>
								<option value="5">복지정보본부</option>
								<option value="6">보건의료본부</option>
								<option value="7">희망복지중앙지원단</option>
								<option value="8">바우처관리본부</option>
								<option value="9">바우처정보본부</option>
								<option value="10">사회보장연구소</option>
							</select>
						</div>
					</div>
				</div>

				<br /><br />
				<!-- 보안점검 체크 부분 -->
				<label class="control-label">2. 서류보관 상태</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_document" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_document" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_document" id="option3" value="2" required> 양호
					</label>
				</div>
				</br> </br> <label class="control-label">3. 청소 상태</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_clean" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_clean" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_clean" id="option3" value="2" required> 양호
					</label>
				</div>
				<br /> </br> <label class="control-label">4. 소등상태</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_lightout" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_lightout" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_lightout" id="option3" value="2" required> 양호
					</label>
				</div>
				</br> </br> <label class="control-label">5. 환기상태</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_ventilation" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_ventilation" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_ventilation" id="option3" value="2" required> 양호
					</label>
				</div>
				</br> </br> <label class="control-label">6. 문단속</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_door" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_door" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_door" id="option3" value="2" required> 양호
					</label>
				</div>

				<!-- 보안점검 체크 끝 -->
				<br />

				<div class="control-group">
					<label class="control-label" for="textarea2">7. 기타사항</label>
					<div class="controls">
						<textarea class="input-xlarge textarea" name="os_etc" placeholder="기타사항을 입력하세요." ></textarea>
					</div>
				</div>
				<br />

				<div class="control-group">
					<label class="control-label" for="fileInput">
					<span class="icon fa-camera"> 사진 첨부</span><br /> 
					<input type="file" accept="image/*" capture="camera" name="os_image"> </label>
				</div>
				<div class="form-actions">
				<br />
					<input type="submit" value="제출하기" />
				</div>
			</form>
		</div>
	</section>
</div>
<!-- 끝 -->
<script>
function changeValue(val) {
    //값 변경시 
}

function checkOSFForm(){
	if(osff.os_deptcode.value == "0"){
		alert("부서를 선택해주세요.");
		return false;
	}
}
</script>
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
