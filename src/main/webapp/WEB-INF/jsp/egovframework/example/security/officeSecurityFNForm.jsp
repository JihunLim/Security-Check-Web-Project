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
			<form name="officeSecurityFNForm" method="post"
				action="<%=context%>/officeSecurityFNCheck.do"
				onsubmit="return checkOfficeForm()" enctype="multipart/form-data">

				<div class="row">
					<div class="2u 12u$(mobile)">
						<label class="control-label" for="select01">점검부서</label>
					</div>
					<div class="4u$ 12u$(mobile)">
						<input type="hidden" name="os_empemail"
							value=<s:authentication property="name"/> />
						<div class="controls">
							<select name="os_deptcode" class="dropdown">
								<option value="1">경영지원본부</option>
								<option value="2">바우처본부</option>
								<option value="3">보건의료본부</option>
								<option value="4">고객지원본부</option>
								<option value="5">정보기술본부</option>
								<option value="6">복지정보운영본부</option>
								<option value="7">복지정보관리본부</option>
								<option value="8">희망복지본부</option>
								<option value="9">사회보장정보연구소</option>

							</select>
						</div>
					</div>
				</div>

				<br />
				<!-- 보안점검 체크 부분 -->
				<label class="control-label">서류보관 상태</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_document" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_document" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_document" id="option3" value="2" required> 양호
					</label>
				</div>
				</br> </br> <label class="control-label">청소 상태</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_clean" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_clean" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_clean" id="option3" value="2" required> 양호
					</label>
				</div>
				<br /> </br> <label class="control-label">소등상태</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_lightout" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_lightout" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_lightout" id="option3" value="2" required> 양호
					</label>
				</div>
				</br> </br> <label class="control-label">환기상태</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary"> <input type="radio"
						name="os_ventilation" id="option1" value="0" required> 미흡
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_ventilation" id="option2" value="1" required> 보통
					</label> <label class="btn btn-primary"> <input type="radio"
						name="os_ventilation" id="option3" value="2" required> 양호
					</label>
				</div>
				</br> </br> <label class="control-label">문단속</label>
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
					<label class="control-label" for="textarea2">Comment</label>
					<div class="controls">
						<textarea class="input-xlarge textarea" name="os_etc"
							placeholder="기타사항을 입력하세요." style="width: 810px; height: 200px"></textarea>
					</div>
				</div>
				<br />

				<div class="control-group">
					<label class="control-label" for="fileInput"><span
						class="icon fa-camera"> 사진 첨부</span> <input type="file"
						accept="image/*" capture="camera" name="os_image"> </label>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">저장</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</form>
		</div>
	</section>
</div>
<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
