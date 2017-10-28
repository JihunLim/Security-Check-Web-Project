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
				<h2>사무실 보안점검(최종퇴실자 용)</h2>
			</header>

			<form class="form-horizontal" name="officeSecurityForm" method="post"
				action="<%=context%>/officeSecurityCheck.do"
				onsubmit="return checkForm()">

				<input type="hidden" name="os_empemail"
					value=<s:authentication property="name"/>><br />

				<div class="form-group">
					<label class="control-label col-sm-2" for="os_document">서류보관상태:
					</label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_document" value="0">미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_document" value="1">보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_document" value="2">양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="os_clean">청소상태:
					</label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_clean" value="0">미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_clean" value="1">보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_clean" value="2">양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="os_lightout">소등상태:
					</label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_lightout" value="0">미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_lightout" value="1">보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_lightout" value="2">양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="os_ventilation">환기상태:
					</label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_ventilation" value="0">미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_ventilation" value="1">보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_ventilation" value="2">양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="os_door">문단속: </label>
					<div class="col-sm-10">
						<label class="control-label col-sm-2"><input type="radio"
							name="os_door" value="0">미흡</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_door" value="1">보통</label> <label
							class="control-label col-sm-2"><input type="radio"
							name="os_door" value="2">양호</label><br />
						<br />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="comment">Comment:</label>
					<div class="col-sm-5">
						<textarea class="form-control" rows="5" name="os_etc"></textarea>
						<br />
						<br />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2"><button type="제출"
							class="btn-default">Submit</button></label>
				</div>
			</form>



		</div>
	</section>
</div>


<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>