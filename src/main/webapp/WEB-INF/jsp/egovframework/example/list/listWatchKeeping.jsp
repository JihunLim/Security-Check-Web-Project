<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>

<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section class="white">
		<div class="container">

			<header>
				<h2>당직근무일지 조회</h2>
			</header>
			<p>추후에 employee 테이블과 watchkeeping 테이블과 dept 테이블 조인시켜서 이메일 대신
				회원부서와 이름 가져오기</p>

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





















</div>




</fieldset>
</div>
<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>
