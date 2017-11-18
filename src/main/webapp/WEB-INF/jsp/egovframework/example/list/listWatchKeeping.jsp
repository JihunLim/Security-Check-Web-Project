<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<script>
	//원하는 페이지로 이동시 검색조건
	function fnGoPaging(page){
    	location.href="<%=cp%>/listWatchKeeping.do?page=" + page;
	}
</script>
<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section  class="one dark">
		<div class="container">
			<header>
				<h2>당직근무일지 조회</h2>
			</header>
		</div>
		</section>
		
		<!-- Single button -->
	<div class="container">
		<div class="btn-group">
			<form method="post" action="<%=cp%>/listOfficeSecurity.do?page=1">
				<div class="row">
					<div class="10u 10u(mobile)" style="text-align:left;">
						기간선택 : <input type="date" name="startDate"> ~ <input type="date" name="endDate">
					</div>			
					<div class="2u$ 2u$(mobile)" style="text-align:right;">
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
				</div>

			</form>


		</div>
	</div>
		
		<section class="white">
			<div class="container">
			<div class="block-content collapse in">	
			<table class="table table-hover">
				<thead>
					<tr>
						<th>일시</th>
						<th>당직자</th>
						<th>평균 근무자현황</th>
						<th>당직점검일지</th>
						<th>사무실점검일지</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="dto">
					<tbody>
						<tr style = "cursor:pointer;" onClick="location.href='contentWatchKeeping.do?id=${dto.wk_id}'" >
							<td>${dto.wk_datetime}</td>
							<td>${dto.deptName}&nbsp;${dto.emp_name}</td>
							<td>${dto.avg_score}</td>
							<td><a href="extractWatchKeeping.do?id=${dto.wk_id}" class="skel-layers-ignoreHref"><span class="icon fa-file-text-o"></span></a></td>
							<td><span class="icon fa-file-text"></span></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			</div>
			<!-- 페이지 번호 구현  -->
	
					<ul class="pagination">
						<c:if test="${paging.pageGroup > 1}">
							<span><a
								href="javascript:fnGoPaging(<c:out value='${paging.prePage}'/>)">
									&laquo;&nbsp;</a></span>
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
