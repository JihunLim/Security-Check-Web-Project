<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
추후에 employee 테이블과 watchkeeping 테이블과 dept 테이블 조인시켜서 이메일 대신 회원부서와 이름 가져오기
<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>일시</td>
		<td>이메일</td>
		<td>지시받은사항</td>
		<td>조치사항</td>
		<td>a부서 근무자 현황</td>
		<td>b부서 근무자 현황</td>
		<td>c부서 근무자 현황</td>
		<td>d부서 근무자 현황</td>
		<td>e부서 근무자 현황</td>
		<td>f부서 근무자 현황</td>
		<td>g부서 근무자 현황</td>
		<td>h부서 근무자 현황</td>
		<td>i부서 근무자 현황</td>
		<td>당직중 특이사항</td>
		<td>보고사항</td>
		<td>인계사항</td>
		
		
	<tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.wk_datetime}</td>
		<td>${dto.wk_empemail}</td>
		<td>${dto.wk_indication}</td>
		<td>${dto.wk_measure}</td>
		<td>${dto.wk_na}</td>
		<td>${dto.wk_nb}</td>
		<td>${dto.wk_nc}</td>
		<td>${dto.wk_nd}</td>
		<td>${dto.wk_ne}</td>
		<td>${dto.wk_nf}</td>
		<td>${dto.wk_ng}</td>
		<td>${dto.wk_nh}</td>
		<td>${dto.wk_ni}</td>
		<td>${dto.wk_specificity}</td>
		<td>${dto.wk_report}</td>
		<td>${dto.wk_delivery}</td>
		
	<tr>
	</c:forEach>
</table>

</body>
</html>