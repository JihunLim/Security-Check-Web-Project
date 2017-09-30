<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 로그인 정보 출력 -->
	USER ID : <s:authentication property="name"/><br/>
	<a href = "${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a>
	
	<h1>사용자 메뉴</h1>
	
	<h2>일일 보안점검</h2>
	<a href="officeSecurityChoice.do">사무실 보안점검 작성</a><br /><br />
	<a href="watchKeepingForm.do">당직근무일지 작성 </a><br /><br />
	
	<h2>보안 점검조회</h2>
	<a href="listOfficeSecurity.do">보안점검 조회</a><br /><br />
	<a href="listWatchKeeping.do">당직근무일지 조회 </a><br /><br />
	<a href="#">S.M.A.R.T 보안솔루션 (미완성)</a><br /><br />
	
	<h2><a href="#">당직 근무표(미완성)</a></h2><br /><br />
	
	<!-- 관리자의 경우에만 관리자 메뉴 출력 -->
	<s:authorize access="hasAuthority('ROLE_ADMIN')">
		<h1>관리자 메뉴</h1>
	
		<a href="updateDept.do">부서 업데이트</a><br /><br />
		<a href="#">당직자 변경</a><br /><br />
		<a href="#">보안담당자 변경</a><br /><br />
	</s:authorize>
	
	
	
</body>
</html>