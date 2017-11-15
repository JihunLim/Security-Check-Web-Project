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
											
			<table class="table">
				<thead>
					<tr>
						<th>일시</th>
						<th>이메일</th>
						<th>지시받은사항</th>
						<th>조치사항</th>
						<th>경영기획본부 근무자 현황</th>
						<th>바우처본부 근무자 현황</th>
						<th>보건의료본부 근무자 현황</th>
						<th>고객지원본부 근무자 현황</th>
						<th>정보기술본부 근무자 현황</th>
						<th>복지정보운영본부 근무자 현황</th>
						<th>복지정보관리본부 근무자 현황</th>
						<th>희망복지본부 근무자 현황</th>
						<th>사회보장정보연구소 근무자 현황</th>
						<th>당직중 특이사항</th>
						<th>보고사항</th>
						<th>인계사항</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="dto">
					<tbody>
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
									<span class="active"><a href="javascript:fnGoPaging(${i});">${i}&nbsp;</a></span>
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
