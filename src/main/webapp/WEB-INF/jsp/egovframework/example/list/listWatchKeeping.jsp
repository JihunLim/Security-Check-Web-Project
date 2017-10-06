<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>    
<%String cp= request.getContextPath(); %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 상단 메뉴 바 고정 -->
	<nav class="navbar navbar-inverse">
  		<div class="container-fluid" role="form">
  		
    		<div class="col-md-3">
     	 		<a class="navbar-brand" href="#">Office Security Management System</a>
    		</div>
    		<div class="col-md-6">
    		<ul class="nav navbar-nav">
      		<li><a color:#FFFFF> ${deptName}  ${emp_name} (${auth})님 안녕하세요. <br/></li>
    		</ul>
    		</div>
    		<ul class="nav navbar-nav navbar-right">
      		<li><a href="${pageContext.request.contextPath}/j_spring_security_logout"><span class="glyphicon glyphicon-log-in"></span>Log Out</a></li>
    		</ul>
  		</div>
	</nav>
	
	<h2>당직 근무일지 조회</h2>
	<p>추후에 employee 테이블과 watchkeeping 테이블과 dept 테이블 조인시켜서 이메일 대신 회원부서와 이름 가져오기</p>
	
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>일시</th>
					<th>이메일</th>
					<th>지시받은사항</th>
					<th>조치사항</th>
					<th>경영기획본부 근무자 현황</th>
					<th>바우처본부 근무자 현황</th>
					<th>보건의료본부 근무자 현황</th>
					<th>고객지원본부 근무자 현황</th>
					<th>정보기술본부 근무자 현황</th>
					<td>복지정보운영본부 근무자 현황</th>
					<td>복지정보관리본부 근무자 현황</th>
					<th>희망복지본부 근무자 현황</th>
					<th>사회보장정보연구소 근무자 현황</th>
					<th>당직중 특이사항</th>
					<th>보고사항</th>
					<th>인계사항</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="dto">
			<tbody>
				<tr>
					<td>${dto.wk_datetime}</td>
					<td>${dto.wk_empemail}</td>
					<td>${dto.wk_indication}</td>
					<td>${dto.wk_measure}</td>
					<td>${dto.wk_mpd}</td>
					<td>${dto.wk_vmd}</td>
					<td>${dto.wk_hmd}</td>
					<td>${dto.wk_csd}</td>
					<td>${dto.wk_itd}</td>
					<td>${dto.wk_wio}</td>
					<td>${dto.wk_wim}</td>
					<td>${dto.wk_hwd}</td>
					<td>${dto.wk_sii}</td>
					<td>${dto.wk_specificity}</td>
					<td>${dto.wk_report}</td>
					<td>${dto.wk_delivery}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
	
	<!-- 페이지 설정 -->
	<div class = "container">
		<ul class="pagination">
			<li class="disabled"><a href="#">&laquo;</a></li>
    		<li class="active"><a href="#">1</a></li> <!-- 초기 페이지 설정 -->
    		<li><a href="#">2</a></li>
    		<li><a href="#">3</a></li>
    		<li><a href="#">4</a></li>
    		<li><a href="#">5</a></li>
    		<li ><a href="#">&raquo;</a></li>
  		</ul>
	</div>
	
	
</body>
</html>