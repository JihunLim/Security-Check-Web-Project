<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
	//원하는 페이지로 이동시 검색조건
	function fnGoPaging(page){
    	location.href="<%=cp%>/listOfficeSecurity.do?page=" + page;
	}
</script>

<!-- Main -->
<div id="main">
	<div class = "main_page"		style="margin:0;">
		<a href="mainmenu.do"><img src= "images/home_logo.PNG" style="float:left; margin:10px 10px -15px 10px; padding-left:20px;"></a>
		<img src= "images/line.png" style="width:100%; height:5px; margin:0px;">
	</div>
	<!-- Intro -->
	<section class="one dark">
		<div class="container">
			<header>
				<h2>사무실 보안점검 조회</h2>
			</header>
		</div>
	</section>

	<!-- Search Menu -->
	<div class="container">
		<div class="btn-group">
			<form method="post" action="<%=cp%>/listOfficeSecurity.do?page=1">
			 <s:authorize access="hasAuthority('ROLE_ADMIN')">
				<div class="row">
					<div class="5u 12u$(mobile)" style="float:left;font-size: 0.8em;">
						<select name="changeDept" style="font-size: 0.9em;height: 2.7em;width:12em;">
							<option value="0">부서를 선택하세요.</option>
							<option value="1">경영기획본부</option>
							<option value="2">정보기술본부</option>
							<option value="3">고객지원본부</option>
							<option value="4">정보개발본부</option>
							<option value="5">복지정보본부</option>
							<option value="6">보건의료본부</option>
							<option value="7">희망복지중앙지원단</option>
							<option value="8">바우처관리본부</option>
							<option value="9">바우처정보본부</option>
							<option value="10">사회보장연구소</option>
							<option value="0">전체보기</option>
							
						</select>
					</div>
					
					
					<div class="5u 12u$(mobile)" style="vertical-align:middle;">
						<label style="font-size:0.8em">조회기간 : <input type="date" name="startDate" style="font-size: 0.8em;height: 2em;width:10em;"> ~ <input type="date" name="endDate" style="font-size: 0.8em;height: 2em;width:10em;"></label>
					</div>
					<div class="2u$ 12u$(mobile)">
						<button type="submit" class="btn btn-primary" style="float:right;vertical-align:middle;">검색</button>
					</div>
				</div>
				</s:authorize>
				<s:authorize access="hasAuthority('ROLE_USER')">
				<div class="row">
					<div class="9u 12u$(mobile)" style="vertical-align:middle;">
						<label style="font-size:0.8em">조회기간 : <input type="date" name="startDate" style="font-size: 0.8em;height: 2em;width:10em;"> ~ <input type="date" name="endDate" style="font-size: 0.8em;height: 2em;width:10em;"></label>
					</div>
					<div class="3u$ 12u$(mobile)">
						<button type="submit" class="btn btn-primary" style="float:right;margin:5px 0 0 0;">검색</button>
					</div>
				</div>
				</s:authorize>
				
				
			</form>
		</div>
	</div>

	<section class="white">
		<div class="container">
			<div
				style="border: 0px solid black; overflow-y: hidden; overflow-x: scroll;">

				<table width="800" cellpadding="0" cellspacing="0" border="1">
					<thead>
						<tr style="background: #eee; border-bottom: 3px inset #ccc;">
							<th width="110">일시</th>
							<th>부서</th>
							<th>점검자</th>
							<th>문서</th>
							<th>청소</th>
							<th>소등</th>
							<th>환기</th>
							<th>문단속</th>
							<th width="140">비고</th>
							<th>사진</th>
							<th>점검일지</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="dto">
						<tbody>
							<tr>
								<td bgcolor="#FFFAF0" style="border-right: 1px solid #ccc;border-left: 0px solid #ccc;">${dto.os_datetime}</td>
								<td>${dto.deptName}</td>
								<td>${dto.emp_name}</td>
								<td>${dto.str_document}</td>
								<td>${dto.str_clean}</td>
								<td>${dto.str_lightout}</td>
								<td>${dto.str_ventilation}</td>
								<td>${dto.str_door}</td>
								<td width="140">${dto.os_etc}</td>
								<td><c:if test="${fn:length(dto.os_image)>0}">
										<a href="ShowImageFunc.do?imgIdx=${dto.os_id}"
											class="skel-layers-ignoreHref"><span
											class="icon fa-picture-o"></span></a>
									</c:if></td>
								<td><a href="extractOfficeSecurity.do?date=${dto.os_datetime}&dept=${dto.os_deptcode}" class="skel-layers-ignoreHref"><span class="icon fa-file-text"></span></a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<!-- 페이지 번호 구현  -->

			<ul class="pagination">
				<c:if test="${paging.pageGroup > 1}">
					<span><a
						href="javascript:fnGoPaging(<c:out value='${paging.prePage}'/>)">&laquo;&nbsp;
					</a></span>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage}"
					end="${paging.endPage > paging.totalPage ? paging.totalPage : paging.endPage}"
					varStatus="status">
					<c:choose>
						<c:when test="${paging.page eq i}">
							<span class="active" style="color:#e8cc74;"><a href="javascript:fnGoPaging(${i});">${i}&nbsp;</a></span>
						</c:when>
						<c:otherwise>
							<span><a href="javascript:fnGoPaging(${i});">${i}&nbsp;</a></span>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.nextPage <= paging.totalPage}">
					<span><a
						href="javascript:fnGoPaging(<c:out value='${paging.nextPage}'/>)">&raquo;&nbsp;</a></span>
				</c:if>
			</ul>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>

	