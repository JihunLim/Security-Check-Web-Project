<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>www.webmadang.net</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script language="javascript">
<!--
var oTbl;
//Row 추가
function insRow() {
  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
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

function frmCheck()
{
  var frm = document.form;
  
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText" )
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
                 frm.elements[i].focus();
	 return;
          }
      }
   }
 }
//-->
</script>
</head>
<body>
<form name="form" method="post">
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2" align="left" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td colspan="5" bgcolor="#FFFFFF" height="25" align="left">
         <input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">
         <font color="#FF0000">*</font>추가</td>
        </tr>
        <tr>
         <td height="25">
           <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
            <tr>
              <td><input type="text" name="addText" style="width:350px; height:20px;"></td>
              <td align="left"></td>
            </tr>
          </table></td>
        </tr>
       </table>
      </td>
   </tr>
 </table>
 <table width="400" border="0" cellspacing="0" cellpadding="0">

 </table>
</form>
</body>
</html>