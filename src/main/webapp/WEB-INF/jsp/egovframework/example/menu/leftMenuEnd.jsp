<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

</div>
			<!--/.col-xs-12.col-sm-9-->


			<!-- 시작 : 왼쪽 메뉴 -->
			<div class="col-xs-3 col-sm-2 col-sm-pull-9 sidebar-offcanvas"
				id="sidebar">
				<div class="list-group">
					<ul class="list-group">
						<a href="officeSecurityChoice.do" class="list-group-item">사무실 보안점검 작성(당직자용 남음)</a>
						<a href="watchKeepingForm.do" class="list-group-item">당직 근무일지 작성</a>
						<a href="listOfficeSecurity.do" class="list-group-item">보안 점검 조회</a>
						<a href="listWatchKeeping.do" class="list-group-item">당직 근무일지 조회</a>
						<a href="smartSecuritySolution.do" class="list-group-item">S.M.A.R.T 보안 솔루션(...)</a>
						<a href="nightDutyTable.do" class="list-group-item"><span class="badge"></span>당직근무표(...)</a>
						<s:authorize access="hasAuthority('ROLE_ADMIN')">
							<a href="updateDept.do" class="list-group-item">부서 업데이트</a>
							<a href="updateManager.do" class="list-group-item">보안 담당자 변경</a>
						</s:authorize>

					</ul>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
			<!-- 시작 : 왼쪽 메뉴 -->

		</div>
		<!--/row-->
		<hr>
	</div>
	<!--/.container-->
	<%String cp2= request.getContextPath(); %>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%=cp2%>/bootstrap/js/bootstrap.js"></script>
</body>
<!-- 끝 : body 태그 시작 -->
</html>