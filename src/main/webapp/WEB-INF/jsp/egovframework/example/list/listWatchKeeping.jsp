<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp" %>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuStart.jsp" %>
	<!-- 시작 -->
	<fieldset>
			<legend>
				<h2>당직근무일지 조회</h2>
			</legend>
				<p>추후에 employee 테이블과 watchkeeping 테이블과 dept 테이블 조인시켜서 이메일 대신
					회원부서와 이름 가져오기</p>

				<div class="container">
				<div class="table-toolbar">
                                     
                                      <!-- search data 검색 기능 추가 -->
                                      <div class="col-sm-3 col-md-3">
                                      <div class="input-group">
                                       <input type="text" class="form-control" placeholder="부서명/사원이름/내용">
                                       <span class="input-group-btn">
                                       		<button class="btn btn-secondary" type="button">search</button>
                                       </span>
                                      </div>
                                      </div>
                                      <div class="btn-group pull-right">
                                         <button data-toggle="dropdown" class="btn dropdown-toggle">Tools <span class="caret"></span></button>
                                         <ul class="dropdown-menu">
                                            <li><a href="#">Print</a></li>
                                            <li><a href="#">Save as PDF</a></li>
                                            <li><a href="#">Export to Excel</a></li>
                                         </ul>
                                      </div>
                 </div>
                                    
					<table class="table table-hover">
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
								<td>복지정보운영본부 근무자 현황</th>
					<td>복지정보관리본부 근무자 현황
								</th>
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
	
	<!-- 페이지 설정 -->
	<div class="container">
		<ul class="pagination">
			<li class="disabled"><a href="#">&laquo;</a></li>
    		<li class="active"><a href="#">1</a></li> <!-- 초기 페이지 설정 -->
    		<li><a href="#">2</a></li>
    		<li><a href="#">3</a></li>
    		<li><a href="#">4</a></li>
    		<li><a href="#">5</a></li>
    		<li><a href="#">&raquo;</a></li>
  		</ul>
	</div>
				
	</fieldset>			
	<!-- 끝 -->
	
	
	
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuEnd.jsp" %>
