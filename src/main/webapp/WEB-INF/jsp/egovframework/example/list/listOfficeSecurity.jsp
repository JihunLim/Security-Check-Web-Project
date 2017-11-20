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
	<!-- Intro -->
	<section class="one dark">
		<div class="container">
			<header>
				<h2>사무실 보안점검 조회</h2>
			</header>
		</div>
	</section>

	<!-- Single button -->
	<div class="container">
		<div class="btn-group">
			<form method="post" action="<%=cp%>/listOfficeSecurity.do?page=1">
			 <s:authorize access="hasAuthority('ROLE_ADMIN')">
				<div class="row">
					<div class="5u 12u$(mobile)" style="float:left;font-size: 0.8em;">
						<select name="changeDept" style="font-size: 0.9em;height: 2.5em;width:12em;">
							<option value="0">부서를 선택하세요.</option>
							<option value="1">경영지원본부</option>
							<option value="2">바우처본부</option>
							<option value="3">보건의료본부</option>
							<option value="4">고객지원본부</option>
							<option value="5">정보기술본부</option>
							<option value="6">복지정보운영본부</option>
							<option value="7">복지정보관리본부</option>
							<option value="8">희망복지본부</option>
							<option value="9">사회보장정보연구소</option>
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

				<table>
					<thead>
						<tr>
							<th>일시</th>
							<th>부서</th>
							<th>점검자</th>
							<th>문서</th>
							<th>청소</th>
							<th>소등</th>
							<th>환기</th>
							<th>문단속</th>
							<th>비고</th>
							<th>사진</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="dto">
						<tbody>
							<tr>
								<td>${dto.os_datetime}</td>
								<td>${dto.deptName}</td>
								<td>${dto.emp_name}</td>
								<td>${dto.str_document}</td>
								<td>${dto.str_clean}</td>
								<td>${dto.str_lightout}</td>
								<td>${dto.str_ventilation}</td>
								<td>${dto.str_door}</td>
								<td>${dto.os_etc}</td>
								<td><c:if test="${fn:length(dto.os_image)>0}">
										<a href="ShowImageFunc.do?imgIdx=${dto.os_id}"
											class="skel-layers-ignoreHref"><span
											class="icon fa-picture-o"></span></a>
									</c:if></td>
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
