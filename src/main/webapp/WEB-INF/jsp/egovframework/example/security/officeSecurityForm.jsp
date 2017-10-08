<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%String cp= request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,initial-scale="1">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.min.css" />
<title>사회보장정보원 보안시스템</title>
<script type="text/javascript">
        //submit
        function checkForm() {
               //값에 대한 검사 : 브라우저 내부에서...
               if(document.officeSecurityForm.name.value == ""){
                       alert("부서이름이 없습니다.");
                       return false;          //onsubmit의 경우 return false를 줘야지 전달을 하지 않음!
               }       
        }
	</script>

<!-- 시작 : 윗 부분 상단 바 -->
<nav class="navbar navbar-fixed-top navbar-inverse">
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="mainmenu.do">O.S.M.S</a>
	</div>

	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">

			<li><p class="navbar-text">
					<span class="glyphicon glyphicon-user"></span>${deptName}
					${emp_name} (${auth})님 안녕하세요.
				</p></li>
			<li><a
				href="${pageContext.request.contextPath}/j_spring_security_logout">
					<span class="glyphicon-log-out"></span>Log Out
			</a></li>
		</ul>
	</div>
	<!-- /.nav-collapse -->
</div>
</nav>
<!-- 끝 : 윗 부분 상단 바 -->
</head>

<!-- 시작 : body 태그 시작 -->
<body style="padding: 60px 0px 0px 0px">

	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9 col-sm-push-2">
				<button type="button" class="pull-left btn btn-default visible-xs"
					data-toggle="offcanvas" aria-expanded="false"
					aria-controls="navbar">
					<i class="fa fa-navicon"></i>
				</button>

				<!-- 시작 : 본 내용 위치 -->
				<%String context = request.getContextPath();%>
				<div class="container">
					<h2>사무실 보안점검</h2>
					<h4>(최종퇴실자 용)</h4>
					<form class="form-horizontal" name="officeSecurityForm"
						method="post" action="<%=context%>/officeSecurityCheck.do"
						onsubmit="return checkForm()">
						
						<input type="hidden" name="os_empemail"
						value=<s:authentication property="name"/>><br /> 
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="os_document">서류보관상태: </label>
							<div class="col-sm-10">
								<label class="control-label col-sm-2"><input type="radio" name="os_document" value="0">미흡</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_document" value="1">보통</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_document" value="2">양호</label><br/><br/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="os_clean">청소상태: </label>
							<div class="col-sm-10">
								<label class="control-label col-sm-2"><input type="radio" name="os_clean" value="0">미흡</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_clean" value="1">보통</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_clean" value="2">양호</label><br/><br/>
							</div>
						</div>
						<div class="form-group">	
							<label class="control-label col-sm-2" for="os_lightout">소등상태: </label>
							<div class="col-sm-10">
								<label class="control-label col-sm-2"><input type="radio" name="os_lightout" value="0">미흡</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_lightout" value="1">보통</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_lightout" value="2">양호</label><br/><br/>
							</div>
						</div>
						<div class="form-group">	
							<label class="control-label col-sm-2" for="os_ventilation">환기상태: </label>
							<div class="col-sm-10">
								<label class="control-label col-sm-2"><input type="radio" name="os_ventilation" value="0">미흡</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_ventilation" value="1">보통</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_ventilation" value="2">양호</label><br/><br/>
							</div>
						</div>	
						<div class="form-group">	
							<label class="control-label col-sm-2" for="os_door">문단속: </label>
							<div class="col-sm-10">
								<label class="control-label col-sm-2"><input type="radio" name="os_door" value="0">미흡</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_door" value="1">보통</label>
								<label class="control-label col-sm-2"><input type="radio" name="os_door" value="2">양호</label><br/><br/>
							</div>
						</div>
						<div class="form-group">
  							<label class="control-label col-sm-2" for="comment">Comment:</label>
  							<div class="col-sm-5">
								<textarea class="form-control" rows="5" name="os_etc"></textarea><br/><br/>
							</div>
						</div>	
							
						<div class="form-group">
							<label class="control-label col-sm-2" ><button type="제출" class="btn-default">Submit</button></label>
						</div>
					</form>
				</div>

				<!-- 끝 : 본 내용 위치 -->
			</div>
			<!--/.col-xs-12.col-sm-9-->


			<!-- 시작 : 왼쪽 메뉴 -->
			<div class="col-xs-3 col-sm-2 col-sm-pull-9 sidebar-offcanvas"
				id="sidebar">
				<div class="list-group">
					<ul class="list-group">
						<a href="officeSecurityChoice.do" class="list-group-item">사무실
							보안점검 작성(당직자용 남음)</a>
						<a href="watchKeepingForm.do" class="list-group-item">당직 근무일지
							작성</a>
						<a href="listOfficeSecurity.do" class="list-group-item">보안 점검
							조회</a>
						<a href="listWatchKeeping.do" class="list-group-item">당직 근무일지
							조회</a>
						<a href="smartSecuritySolution.do" class="list-group-item">SMART
							보안 솔루션(미완성)</a>
						<a href="#" class="list-group-item"><span class="badge"></span>당직근무표(미완성)</a>
						<s:authorize access="hasAuthority('ROLE_ADMIN')">
							<a href="updateDept.do" class="list-group-item">부서 업데이트</a>
							<a href="updateManager.do" class="list-group-item">보안 담당자 변경</a>
						</s:authorize>

					</ul>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
			<!-- 시작 : 왼쪽 메뉴 -->

		</div>
		<!--/row-->
		<hr>
	</div>
	<!--/.container-->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
</body>
<!-- 끝 : body 태그 시작 -->
</html>