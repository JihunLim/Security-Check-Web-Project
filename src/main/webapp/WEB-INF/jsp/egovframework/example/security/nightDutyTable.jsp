<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>

<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section  class="one dark">
		<div class="container">
			<header>
				<h2>당직근무 테이블</h2>
			</header>
		</div>
		</section>
		
		<!-- Single button -->
	<div class="container">
		<div class="btn-group">
			<div class="row">
				<div class="6u 12u$(mobile)">
					<select name="year">
						<option value="#">년도를 선택하세요.
						<option value="nightDutyTable.do?month=1">2017</option>
					</select>
				
					<select onchange="if(this.value) location.href=(this.value);">
						<option value="#">월을 선택하세요.
						<option value="nightDutyTable.do?month=01">1월</option>
						<option value="nightDutyTable.do?month=02">2월</option>
						<option value="nightDutyTable.do?month=03">3월</option>
						<option value="nightDutyTable.do?month=04">4월</option>
						<option value="nightDutyTable.do?month=05">5월</option>
						<option value="nightDutyTable.do?month=06">6월</option>
						<option value="nightDutyTable.do?month=07">7월</option>
						<option value="nightDutyTable.do?month=08">8월</option>
						<option value="nightDutyTable.do?month=09">9월</option>
						<option value="nightDutyTable.do?month=10">10월</option>
						<option value="nightDutyTable.do?month=11">11월</option>
						<option value="nightDutyTable.do?month=12">12월</option>
					</select>
				</div>
				
				<div class="6u 12u$(mobile)">
					<input type="checkbox" value="nightDutyTable.do?month=showMe" onchange="if(this.value) location.href=(this.value);">자신 것만 보기
				</div>
				
				</div>
		</div>
	</div>
		
		<section class="white">
			<div class="container">
				<table width="800" cellpadding="0" cellspacing="0" border="1">
				<tr>
					<td>일시</td>
					<td>당직자 부서</td>
					<td>당직자 이름</td>
				<tr>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.nd_date}</td>
							<td>${dto.deptName}</td>
							<td>${dto.emp_name}</td>
						<tr>
					</c:forEach>
			</table>
		
		</div>
	</section>
</div>

<script type="text/javascript">



</script>

<!-- 끝 -->
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
