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
		<td>경영기획본부 근무자 현황</td>
		<td>바우처본부 근무자 현황</td>
		<td>보건의료본부 근무자 현황</td>
		<td>고객지원본부 근무자 현황</td>
		<td>정보기술본부 근무자 현황</td>
		<td>복지정보운영본부 근무자 현황</td>
		<td>복지정보관리본부 근무자 현황</td>
		<td>희망복지본부 근무자 현황</td>
		<td>사회보장정보연구소 근무자 현황</td>
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
		
	<tr>
	</c:forEach>
</table>

</body>
</html>