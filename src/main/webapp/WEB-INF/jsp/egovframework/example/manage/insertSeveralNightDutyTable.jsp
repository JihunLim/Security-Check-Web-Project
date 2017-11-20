<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>



<!-- Main -->
<div id="main">
	<!-- Intro -->
	<section id="top" class="one dark">
		<div class="container">

			<header>
				<h2>당직테이블 수정하기</h2>
			</header>
		</div>
	</section>




	<script type="text/javascript">
		var count = 0;

		function addForm() {

			var addedFormDiv = document.getElementById("addedFormDiv");
			var str = "";
			str += "<div class='row'><div class='4u 4u(mobile)'><input type='date' name='nd_date' style='color:#000;border:1px;text-align:center;width:10em;' placeholder='1990-01-01'></input></div>";
			str += "<div class='8u$ 8u$(mobile)'><input type='text' name='nd_email' style='color:#000;font-size: 1em;border:1px;text-align:center;width:20em;' placeholder='E-mail을 입력해주세요' required></input></div></div><hr />";

			// 추가할 폼(에 들어갈 HTML)

			var addedDiv = document.createElement("div"); // 폼 생성
			addedDiv.id = "added_" + count; // 폼 Div에 ID 부여 (삭제를 위해)
			addedDiv.innerHTML = str; // 폼 Div안에 HTML삽입
			addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입
			count++;
			document.baseForm.count.value = count;
			// 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장
		}

		function delForm() {

			var addedFormDiv = document.getElementById("addedFormDiv");
			if (count > 0) { // 현재 폼이 두개 이상이면
				var addedDiv = document.getElementById("added_" + (--count));
				// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
				addedFormDiv.removeChild(addedDiv); // 폼 삭제  
			} else { // 마지막 폼만 남아있다면
				document.baseForm.reset(); // 폼 내용 삭제 
			}
		}
	</script>

	<section class="white">
		<div class="container">
			<div onload="addForm();">
				<center>
					<form action="<%=cp%>/insertSeveralNightDutyCheck.do" method="post">

						<input type="hidden" name="count" value="0">
							<div class='row'><div class='4u 4u(mobile)'><input type='date' name='nd_date' style='color:#000;border:1px;text-align:center;width:10em;' placeholder='1990-01-01'></input></div>
							<div class='8u$ 8u$(mobile)'><input type='text' name='nd_email' style='color:#000;font-size: 1em;border:1px;text-align:center;width:20em;' placeholder='E-mail을 입력해주세요' required></input></div></div><hr />
						<div id="addedFormDiv">
						
						</div>
						<BR>
						<!-- 폼을 삽입할 DIV -->

						<input type="Button" value="추가" style="font-size:0.75em; padding: 0.55em 1.0em 0.55em 1.0em;" onclick="addForm()"> 
						<input type="Button" value="삭제" style="font-size:0.75em; padding: 0.55em 1.0em 0.55em 1.0em;" onclick="delForm()"> 
						<input type="Submit" value="제출하기" style="font-size:0.75em; padding: 0.55em 1.0em 0.55em 1.0em;">

					</form>
				</center>
			</div>


		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>