<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<style type="text/css">
table td:last-child {border-right:none;}
table tr:last-child td {border-bottom:none;}
</style>
<script language="javascript">
<!--
	var oTbl;
	//Row 추가
	function insRow() {
		oTbl = document.getElementById("addTable");
		var oRow = oTbl.insertRow();
		oRow.onmouseover = function() {
			oTbl.clickedRowIndex = this.rowIndex
		}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		var oCell = oRow.insertCell();

		//삽입될 Form Tag
		var frmTag = "<input type='text' name='nd_date' style='color:#000;border:0px;text-align:center;' placeholder='1990-01-01'></input>";
		frmTag += "<input type='text' name='nd_email' style='color:#000;font-size: 1em;border:0px;text-align:center;' placeholder='E-mail을 입력해주세요' required></input>";
		frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
		oCell.innerHTML = frmTag;
	}
	//Row 삭제
	function removeRow() {
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}

	function frmCheck() {
		var frm = document.form;

		for (var i = 0; i <= frm.elements.length - 1; i++) {
			if (frm.elements[i].name == "addText") {
				if (!frm.elements[i].value) {
					alert("텍스트박스에 값을 입력하세요!");
					frm.elements[i].focus();
					return;
				}
			}
		}
	}
//-->
</script>

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

	<section class="white">
		<div class="container">

			<form name="form" method="post">
		
						
				<input name="addButton" type="button" style="cursor: hand" onClick="insRow()" value="추가">
		
				<table id="addTable" width="800" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0px">
					<tr>
						<td><input type='text' name='nd_date' style='color:#000;border:0px;text-align:center;' placeholder='1990-01-01'></input></td>
						<td><input type='text' name='nd_email' style='color:#000;font-size: 1em;border:0px;text-align:center;' placeholder='E-mail을 입력해주세요' required></input></td>
						<td align="left"></td>
					</tr>
				</table>
	
			
			
			</form>
			<footer>
				<a href="addDeptForm.do" class="button scrolly">부서 추가</a>
			</footer>
		</div>
	</section>
</div>

<!-- 끝 -->
<%@ include
	file="/WEB-INF/jsp/egovframework/example/menu/bottomMenu.jsp"%>