<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>


<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section id="top" class="one dark cover">
		<div class="container">

			<header>
				<h2>당직근무자 테이블</h2>
			</header>
		</div>
		</section>
		
		<section class="white">
			<div class="container">
			<h1>당직테이블 - 이것을 달력으로 바꿔주지 않을래?</h1>
			<h2>달력에다가 아래 필요한 항목만 가져다가 쓰면 되고, 일시가 키값이야.</h2>
			<table width="800" cellpadding="0" cellspacing="0" border="1">
				<tr>
					<td>일시</td>
					<td>당직자 이메일</td>
					<td>당직자 부서</td>
					<td>당직자 직급</td>
					<td>당직자 이름</td>
				<tr>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.nd_date}</td>
							<td>${dto.nd_empemail}</td>
							<td>${dto.deptName}</td>
							<td>${dto.emp_rank}</td>
							<td>${dto.emp_name}</td>
						<tr>
					</c:forEach>
			</table>

			<h1>당직자 추가 란</h1>
			<h2>달력에다가 당직자를 추가 또는 수정이 용이하게 만들고, 날짜(0000-00-00)와 회원이메일을 리스트로
				전달하면 됨</h2>
			<%
				String context = request.getContextPath();
			%>
			<form name="addNightDutyForm" method="post"
				action="<%=context%>/addNightDutyCheck.do">
				날짜 : <input type="text" name="nd_date" value="2017-11-01" /> 회원 <input
					type="submit" value="당직 추가하기" />
			</form>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>