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
 	<div class = "main_page"		style="margin:0;">
		<a href="mainmenu.do"><img src= "images/home_logo.PNG" style="float:left; margin:10px 10px -15px 10px; padding-left:20px;"></a>
		<img src= "images/line.png" style="width:100%; height:5px; margin:0px;">
	</div>
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
		<div style="vertical-align:middle;">
			<form method="post" action="<%=cp%>/listWatchKeeping.do?page=1">
				<div class="row">
					<div class="9u 12u$(mobile)" style="vertical-align:middle;">
						<label style="font-size:0.8em">조회기간 : <input type="date" name="startDate" style="font-size: 0.8em;height: 2em;width:10em;"> ~ <input type="date" name="endDate" style="font-size: 0.8em;height: 2em;width:10em;"></label>
					</div>
					<div class="3u$ 12u$(mobile)" style="margin:5px 0 0 0;">
						<button type="submit" class="btn btn-primary" style="float:right;vertical-align:middle;">검색</button>
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
