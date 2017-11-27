<!-- 엑셀 -->
 <%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%> 

<!-- 워드 -->
<%-- <%@ page language="java" contentType="application/vnd.word;charset=UTF-8" pageEncoding="UTF-8"%> --%>

<!-- 한글 -->
<%-- <%@ page language="java" contentType="application/hwp;charset=UTF-8" pageEncoding="UTF-8"%> --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%String cp= request.getContextPath(); %>
<!DOCTYPE HTML>
<HTML>
<HEAD>

<%
String fileName = request.getAttribute("fileName").toString(); 

//******************************MS excel*****************************
 // MS excel로 다운로드/실행, filename에 저장될 파일명을 적어준다.
    response.setHeader("Content-Disposition","attachment;filename=\""+fileName+"\"");
    response.setHeader("Content-Description", "JSP Generated Data");
    // ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
//  response.setContentType("application/vnd.ms-excel");
 
//******************************MS word********************************
    // MS word로 다운로드/실행, filename에 저장될 파일명을 적어준다.
//  response.setHeader("Content-Disposition", "attachment;filename=member.doc");
//  response.setHeader("Content-Description", "JSP Generated Data");
    // ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다. 
//  response.setContentType("application/vnd.ms-word");

//******************************한글(hwp)********************************
    // 한글(hwp)로 다운로드/실행, filename에 저장될 파일명을 적어준다.
  //response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
  //response.setHeader("Content-Description", "JSP Generated Data");
    // ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
//  response.setContentType("application/hwp");
//*********************************************************************
%>
<STYLE type="text/css">
<!--
p.HStyle0
	{style-name:"바탕글"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle0
	{style-name:"바탕글"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle0
	{style-name:"바탕글"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle1
	{style-name:"본문"; margin-left:15.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle1
	{style-name:"본문"; margin-left:15.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle1
	{style-name:"본문"; margin-left:15.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle2
	{style-name:"개요 1"; margin-left:10.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle2
	{style-name:"개요 1"; margin-left:10.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle2
	{style-name:"개요 1"; margin-left:10.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle3
	{style-name:"개요 2"; margin-left:20.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle3
	{style-name:"개요 2"; margin-left:20.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle3
	{style-name:"개요 2"; margin-left:20.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle4
	{style-name:"개요 3"; margin-left:30.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle4
	{style-name:"개요 3"; margin-left:30.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle4
	{style-name:"개요 3"; margin-left:30.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle5
	{style-name:"개요 4"; margin-left:40.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle5
	{style-name:"개요 4"; margin-left:40.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle5
	{style-name:"개요 4"; margin-left:40.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle6
	{style-name:"개요 5"; margin-left:50.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle6
	{style-name:"개요 5"; margin-left:50.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle6
	{style-name:"개요 5"; margin-left:50.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle7
	{style-name:"개요 6"; margin-left:60.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle7
	{style-name:"개요 6"; margin-left:60.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle7
	{style-name:"개요 6"; margin-left:60.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle8
	{style-name:"개요 7"; margin-left:70.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle8
	{style-name:"개요 7"; margin-left:70.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle8
	{style-name:"개요 7"; margin-left:70.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:바탕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle9
	{style-name:"쪽 번호"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:굴림; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle9
	{style-name:"쪽 번호"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:굴림; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle9
	{style-name:"쪽 번호"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:굴림; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle10
	{style-name:"머리말"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:150%; font-size:9.0pt; font-family:굴림; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle10
	{style-name:"머리말"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:150%; font-size:9.0pt; font-family:굴림; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle10
	{style-name:"머리말"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:150%; font-size:9.0pt; font-family:굴림; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle11
	{style-name:"각주"; margin-left:13.1pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:바탕; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle11
	{style-name:"각주"; margin-left:13.1pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:바탕; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle11
	{style-name:"각주"; margin-left:13.1pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:바탕; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle12
	{style-name:"미주"; margin-left:13.1pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:바탕; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle12
	{style-name:"미주"; margin-left:13.1pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:바탕; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle12
	{style-name:"미주"; margin-left:13.1pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:바탕; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle13
	{style-name:"메모"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:9.0pt; font-family:굴림; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle13
	{style-name:"메모"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:9.0pt; font-family:굴림; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle13
	{style-name:"메모"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:9.0pt; font-family:굴림; letter-spacing:-5%; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle14
	{style-name:"제정"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:right; text-indent:0.0pt; line-height:130%; font-size:9.5pt; font-family:신명 신신명조; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle14
	{style-name:"제정"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:right; text-indent:0.0pt; line-height:130%; font-size:9.5pt; font-family:신명 신신명조; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle14
	{style-name:"제정"; margin-top:0.0pt; margin-bottom:0.0pt; text-align:right; text-indent:0.0pt; line-height:130%; font-size:9.5pt; font-family:신명 신신명조; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle15
	{style-name:"제1장"; margin-left:270.4pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:-270.4pt; line-height:172%; font-size:12.0pt; font-family:신명 태고딕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle15
	{style-name:"제1장"; margin-left:270.4pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:-270.4pt; line-height:172%; font-size:12.0pt; font-family:신명 태고딕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle15
	{style-name:"제1장"; margin-left:270.4pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:-270.4pt; line-height:172%; font-size:12.0pt; font-family:신명 태고딕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
p.HStyle16
	{style-name:"표제목"; margin-left:11.2pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:-11.2pt; line-height:172%; font-size:13.0pt; font-family:신명 태고딕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
li.HStyle16
	{style-name:"표제목"; margin-left:11.2pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:-11.2pt; line-height:172%; font-size:13.0pt; font-family:신명 태고딕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
div.HStyle16
	{style-name:"표제목"; margin-left:11.2pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:-11.2pt; line-height:172%; font-size:13.0pt; font-family:신명 태고딕; letter-spacing:0; font-weight:normal; font-style:normal; color:#000000;}
-->
</STYLE>
</HEAD>

<BODY>

<P CLASS=HStyle0>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<TR>
	<TD colspan="13" valign="middle" style='width:693;height:21;border-left:solid #000000 1.1pt;border-right:solid #000000 1.1pt;border-top:solid #000000 1.1pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0><SPAN STYLE='font-family:"휴먼명조";letter-spacing:-5%'>[별지 제3호서식]</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="13" valign="middle" style='width:693;height:72;border-left:solid #000000 1.1pt;border-right:solid #000000 1.1pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle16 STYLE='margin-left:26.8pt;text-indent:-26.8pt;line-height:200%;'><SPAN STYLE='font-size:20.0pt;font-family:"휴먼명조";font-weight:bold;line-height:200%'>보 안 점 검 표</SPAN><SPAN STYLE='font-size:15.0pt;font-family:"휴먼명조";font-weight:bold;line-height:200%'>(제8조 관련)</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="9" valign="middle" style='width:494;height:30;border-left:solid #000000 1.1pt;border-right:none;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle16 STYLE='margin-left:26.8pt;text-align:right;text-indent:-26.8pt;line-height:180%;'><SPAN STYLE='font-size:14.0pt;font-family:"휴먼명조";line-height:180%'>본부명 : </SPAN></P>
	</TD>
	<TD colspan="4" valign="middle" style='width:199;height:30;border-left:none;border-right:solid #000000 1.1pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle16 STYLE='margin-left:26.8pt;text-indent:-26.8pt;line-height:180%;'><SPAN STYLE='font-size:14.0pt;font-family:"휴먼명조";line-height:180%'>&nbsp;${deptName}</SPAN></P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:89;height:34;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:44;height:34;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='letter-spacing:50%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:44;height:34;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:44;height:34;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:44;height:34;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='letter-spacing:50%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:44;height:34;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:97;height:34;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='letter-spacing:50%'>&nbsp;</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:229;height:34;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>점검시각 및 점검자</P>
	</TD>
	<TD valign="middle" style='width:56;height:34;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:89;height:55;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>점검일</P>
	</TD>
	<TD valign="middle" style='width:44;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>① 서류보관상태</P>
	</TD>
	<TD valign="middle" style='width:44;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>②</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>청소상태</P>
	</TD>
	<TD valign="middle" style='width:44;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>③</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>소등상태</P>
	</TD>
	<TD valign="middle" style='width:44;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>④</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>화기단속상태</P>
	</TD>
	<TD valign="middle" style='width:44;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>⑤</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>문단속상태</P>
	</TD>
	<TD valign="middle" style='width:97;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>⑥</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>비고</P>
	</TD>
	<TD colspan="3" valign="middle" style='width:109;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>최종퇴청자</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:120;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>당직근무자</P>
	</TD>
	<TD valign="middle" style='width:56;height:55;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>결재</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:89;height:35;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:44;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:44;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:44;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:44;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:44;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:97;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:62;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>점검시각</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:47;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>성명</P>
	</TD>
	<TD valign="middle" style='width:73;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>점검시각</P>
	</TD>
	<TD valign="middle" style='width:47;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>성명</P>
	</TD>
	<TD valign="middle" style='width:56;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;</P>
	</TD>
</TR>

<c:forEach items="${list}" var="dto" varStatus="status">
	<TR>
	<TD valign="middle" style='width:89;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.str_date_off}</P>
	</TD>
	<TD valign="middle" style='width:44;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.str_document}</P>
	</TD>
	<TD valign="middle" style='width:44;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.str_clean}</P>
	</TD>
	<TD valign="middle" style='width:44;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.str_lightout}</P>
	</TD>
	<TD valign="middle" style='width:44;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.str_ventilation}</P>
	</TD>
	<TD valign="middle" style='width:44;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.str_door}</P>
	</TD>
	<TD valign="middle" style='width:97;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.os_etc}</P>
	</TD>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.str_time_off}</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:47;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${dto.emp_name}</P>
	</TD>
	<TD valign="middle" style='width:73;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${ndData[status.index].str_time_nd}</P>
	</TD>
	<TD valign="middle" style='width:47;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${ndData[status.index].emp_name}</P>
	</TD>
	<TD valign="middle" style='width:56;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>${ndDate[status.index].deptName}</P>
	</TD>
</TR>
</c:forEach>


</TABLE></P>
<P CLASS=HStyle0></P>

</BODY>

</HTML>
