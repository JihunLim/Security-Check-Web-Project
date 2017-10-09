<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp" %>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuStart.jsp" %>
	<!-- 시작 -->
	<!-- 테이블 출력  -->
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
	</div>

	<!-- 페이지 설정 -->
	<div class="container">
		<ul class="pagination">
			<li class="disabled"><a href="#">&laquo;</a></li>
			<li class="active"><a href="#">1</a></li>
			<!-- 초기 페이지 설정 -->
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
				
				
	<!-- 끝 -->
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/leftMenuEnd.jsp" %>