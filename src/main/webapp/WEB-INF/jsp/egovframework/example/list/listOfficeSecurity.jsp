<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>

<script>
	//원하는 페이지로 이동시 검색조건
	function fnGoPaging(page){
    	location.href="<%=cp%>/listOfficeSecurity.do?page=" + page
	}
</script>

<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section class="white">
		<div class="container">
			<header>
				<h2>사무실 보안점검 조회</h2>
			</header>
			<p>간단한 설명</p>

			<table>
				<thead>
					<tr>
						<th>일시</th>
						<th>이메일</th>
						<th>부서</th>
						<th>문서</th>
						<th>청소</th>
						<th>소등</th>
						<th>환기</th>
						<th>문단속</th>
						<th>비고</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="dto">
					<tbody>
						<tr>
							<td>${dto.os_datetime}</td>
							<td>${dto.os_empemail}</td>
							<td>${dto.os_deptcode}</td>
							<td>${dto.os_document}</td>
							<td>${dto.os_clean}</td>
							<td>${dto.os_lightout}</td>
							<td>${dto.os_ventilation}</td>
							<td>${dto.os_door}</td>
							<td>${dto.os_etc}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

			<!-- 페이지 번호 구현  -->
				<div class="row">
				<div class="12u$ 12u$(mobile)">
					<ul class="pagination">
						<c:if test="${paging.pageGroup > 1}">
							<li><a
								href="javascript:fnGoPaging(<c:out value='${paging.prePage}'/>)">
									&laquo;</a></li>
						</c:if>
						<c:forEach var="i" begin="${paging.startPage}"
							end="${paging.endPage > paging.totalPage ? paging.totalPage : paging.endPage}"
							varStatus="status">
							<c:choose>
								<c:when test="${paging.page eq i}">
									<li class="active"><a href="javascript:fnGoPaging(${i});">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="javascript:fnGoPaging(${i});">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.nextPage <= paging.totalPage}">
							<li><a
								href="javascript:fnGoPaging(<c:out value='${paging.nextPage}'/>)">&raquo;</a>
						</c:if>
					</ul>
					</div>
				<div class="12u$ 12u$(mobile)">
					<div class="table-toolbar">
						<!-- search data 검색 기능 추가 -->
						<div class="input-group">
							<input type="text" class="form-control" placeholder="부서명/사원이름/내용">
							<span class="input-group-btn">
								<button class="btn btn-secondary" type="button">search</button>
							</span>
						</div>
					</div>
					</div>
					
					
					
				</div>
				
				
				
				
		</div>
	</section>
</div>
















<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
