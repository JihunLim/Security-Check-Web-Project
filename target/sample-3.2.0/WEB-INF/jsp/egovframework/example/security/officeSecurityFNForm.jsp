<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/leftMenuStart.jsp"%>
<!-- 시작 -->

<div class="container">

	<%String context = request.getContextPath();%>


	<!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->

	<div class="row-fluid">
		<!-- block -->
		<div class="block">

			<div class="block-content collapse in">
				<div class="span12">
					<form name="officeSecurityFNForm" method="post"
						action="<%=context%>/officeSecurityFNCheck.do"
						onsubmit="return checkForm()">
						<fieldset>
							<legend>
								<h2>사무실 보안점검일지 작성(당직자 용)</h2>
							</legend>
							<div class="control-group">
								<label class="control-label" for="select01">부서번호:</label> <input
									type="hidden" name="os_empemail"
									value=<s:authentication property="name"/>><br /> 
								<div class="controls">
									<select name="os_deptcode" class="chzn-select">
										<option value="1">경영기획본부</option>
										<option value="2">보건의료본부</option>
										<option value="3">고객지원본부</option>
										<option value="4">정보기술본부</option>
										<option value="5">희망복지중앙지원단</option>
										<option value="6">정보개발본부</option>
										<option value="7">복지정보본부</option>
										<option value="8">바우처관리본부</option>
										<option value="9">사회보장정보연구소</option>

									</select>
								</div>
							</div>
							<br />
							<!-- 보안점검 체크 부분 -->
							<label class="control-label">서류보관 상태</label>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary"> <input type="radio"
									name="os_document" id="option1" value="0"> 미흡
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_document" id="option2" value="1"> 보통
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_document" id="option3" value="2"> 양호
								</label>
							</div>
							</br> </br> <label class="control-label">청소 상태</label>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary"> <input type="radio"
									name="os_clean" id="option1" value="0"> 미흡
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_clean" id="option2" value="1"> 보통
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_clean" id="option3" value="2"> 양호
								</label>
							</div>
							<br /> </br> <label class="control-label">소등상태</label>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary"> <input type="radio"
									name="os_lightout" id="option1" value="0"> 미흡
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_lightout" id="option2" value="1"> 보통
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_lightout" id="option3" value="2"> 양호
								</label>
							</div>
							</br> </br> <label class="control-label">환기상태</label>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary"> <input type="radio"
									name="os_ventilation" id="option1" value="0"> 미흡
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_ventilation" id="option2" value="1"> 보통
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_ventilation" id="option3" value="2"> 양호
								</label>
							</div>
							</br> </br> <label class="control-label">문단속</label>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary"> <input type="radio"
									name="os_door" id="option1" value="0"> 미흡
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_door" id="option2" value="1"> 보통
								</label> <label class="btn btn-primary"> <input type="radio"
									name="os_door" id="option3" value="2"> 양호
								</label>
							</div>

							<!-- 보안점검 체크 끝 -->
							<br />
							<div class="control-group">
								<label class="control-label" for="date01">날짜</label>
								<div class="controls">
									<input type="text" class="input-xlarge datepicker" id="date01"
										value="02/16/12">
									<p class="help-block">In addition to freeform text, any
										HTML5 text-based input appears like so.</p>
								</div>
							</div>



							<div class="control-group">
								<label class="control-label" for="fileInput">File input</label>
								<div class="controls">
									<input class="input-file uniform_on" id="fileInput" type="file">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="textarea2">Comment</label>
								<div class="controls">
									<textarea class="input-xlarge textarea"
										placeholder="Enter text ..."
										style="width: 810px; height: 200px"></textarea>
								</div>
							</div>
							<br />
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">저장</button>
								<button type="reset" class="btn">취소</button>

							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
		<!-- /block -->
	</div>
</div>


<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/leftMenuEnd.jsp"%>
