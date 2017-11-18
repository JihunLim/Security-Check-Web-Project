<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%String cp= request.getContextPath(); %>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<META NAME="Generator" CONTENT="Hancom HWP 9.1.1.3464">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE></TITLE>
<%
String filename = request.getAttribute("filename").toString(); 
filename = "당직"+filename+".hwp";
//******************************MS excel*****************************
    // MS excel로 다운로드/실행, filename에 저장될 파일명을 적어준다.
   // response.setHeader("Content-Disposition","attachment;filename=member.xls");
  //  response.setHeader("Content-Description", "JSP Generated Data");
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
  response.setHeader("Content-Disposition", "attachment;filename=당직"+filename);
  response.setHeader("Content-Description", "JSP Generated Data");
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

<P CLASS=HStyle0 STYLE='margin-left:11.1pt;text-align:center;text-indent:-11.1pt;'>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<TR>
	<TD colspan="12" valign="top" style='width:644;height:27;border-left:none;border-right:none;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 2.8pt 1.4pt'>
	<P CLASS=HStyle0><SPAN STYLE='font-family:"휴먼명조";letter-spacing:-5%'>[별지 제1호서식] </SPAN><SPAN STYLE='font-family:"휴먼명조";letter-spacing:-8%'>&lt;개정 2013.8.5, 2014.1.29&gt;</SPAN><SPAN STYLE='font-family:"휴먼명조";letter-spacing:-5%'> </SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="12" valign="middle" style='width:644;height:106;border-left:none;border-right:none;border-top:none;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 2.8pt 1.4pt'>
	<P CLASS=HStyle16 STYLE='margin-left:180.8pt;text-indent:-26.8pt;line-height:180%;'><SPAN STYLE='font-size:20.0pt;font-family:"휴먼명조";font-weight:bold;line-height:180%'>당직근무 일지</SPAN><SPAN STYLE='font-size:15.0pt;font-family:"휴먼명조";font-weight:bold;line-height:180%'>(제8조 관련)</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="2" colspan="4" valign="middle" style='width:293;height:75;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 2.8pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='margin-top:10.0pt;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'> ${today}</SPAN></P>
	</TD>
	<TD rowspan="2" valign="middle" style='width:30;height:75;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>결</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>재</SPAN></P>
	</TD>
	<TD colspan="3" valign="middle" style='width:159;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>당&nbsp; 직&nbsp; 자</SPAN></P>
	</TD>
	<TD colspan="4" valign="middle" style='width:162;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>운 영 지 원 부 장</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:159;height:39;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD colspan="4" valign="middle" style='width:162;height:39;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="4" valign="middle" style='width:35;height:146;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>당</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>직</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>자</SPAN></P>
	</TD>
	<TD valign="middle" style='width:101;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>소&nbsp; 속 </SPAN></P>
	</TD>
	<TD valign="middle" style='width:57;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>직급</SPAN></P>
	</TD>
	<TD valign="middle" style='width:101;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>성명</SPAN></P>
	</TD>
	<TD colspan="8" valign="middle" style='width:351;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>문 서 처 리 상 황 </SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="3" valign="middle" style='width:101;height:113;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>${data.deptName}</SPAN></P>
	</TD>
	<TD rowspan="3" valign="middle" style='width:57;height:113;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>${data.emp_rank}</SPAN></P>
	</TD>
	<TD rowspan="3" valign="middle" style='width:101;height:113;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>${data.emp_name}</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:226;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>발&nbsp; 송</SPAN></P>
	</TD>
	<TD rowspan="2" valign="middle" style='width:42;height:76;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>&nbsp;</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>접 수</SPAN></P>
	</TD>
	<TD rowspan="2" valign="middle" style='width:42;height:76;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>&nbsp;</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>인 계</SPAN></P>
	</TD>
	<TD rowspan="2" valign="middle" style='width:42;height:76;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>&nbsp;</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>비 고</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="2" valign="middle" style='width:58;height:43;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>문서번호</SPAN></P>
	</TD>
	<TD valign="middle" style='width:104;height:43;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>수신처</SPAN></P>
	</TD>
	<TD colspan="2" valign="middle" style='width:65;height:43;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>제목</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="2" valign="middle" style='width:58;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>(HHH)</SPAN></P>
	</TD>
	<TD valign="middle" style='width:104;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>(III)</SPAN></P>
	</TD>
	<TD colspan="2" valign="middle" style='width:65;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>(JJJ)</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>(KKK)</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>(LLL)</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:10.8pt;line-height:100%'>(MMM)</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="4" valign="middle" style='width:35;height:142;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>지시</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>받은</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>사항</SPAN></P>
	</TD>
	<TD rowspan="4" valign="middle" style='width:101;height:142;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>${data.wk_indication}</SPAN></P>
	</TD>
	<TD rowspan="4" valign="middle" style='width:57;height:142;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>조</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>치</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>사</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>항</SPAN></P>
	</TD>
	<TD rowspan="4" valign="middle" style='width:101;height:142;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${data.wk_measure}</SPAN></P>
	</TD>
	<TD colspan="2" valign="middle" style='width:58;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:104;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD colspan="2" valign="middle" style='width:65;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="2" valign="middle" style='width:58;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:104;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD colspan="2" valign="middle" style='width:65;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="2" valign="middle" style='width:58;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:104;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD colspan="2" valign="middle" style='width:65;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="2" valign="middle" style='width:58;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:104;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD colspan="2" valign="middle" style='width:65;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
	<TD valign="middle" style='width:42;height:35;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="4" valign="middle" style='width:293;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>&nbsp;&nbsp;&nbsp;당직 중 특이사항 및 처리결과</SPAN></P>
	</TD>
	<TD colspan="8" valign="middle" style='width:351;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 1.1pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>순찰 중 각 부서 근무자 현황</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="5" colspan="4" valign="middle" style='width:293;height:164;border-left:solid #000000 1.1pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${data.wk_specificity}</SPAN></P>
	</TD>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;letter-spacing:-12%;line-height:100%'>소속, 실(부서)</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>인 원 수</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>경영지원본부</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[0]}  외    ${data.wk_mpd}명</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>바우처본부</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[1]}  외    ${data.wk_vmd}명</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>보건의료본부</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[2]}  외    ${data.wk_hmd}명</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>고객지원본부</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[3]}  외    ${data.wk_csd}명</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="5" valign="middle" style='width:35;height:164;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>보</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>고</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>사</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>항</SPAN></P>
	</TD>
	<TD rowspan="5" valign="middle" style='width:101;height:164;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>${data.wk_report}</SPAN></P>
	</TD>
	<TD rowspan="5" valign="middle" style='width:57;height:164;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>인</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>계</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>사</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>항</SPAN></P>
	</TD>
	<TD rowspan="5" valign="middle" style='width:101;height:164;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;line-height:160%'>${data.wk_delivery}</SPAN></P>
	</TD>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>정보기술본부</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[4]}  외    ${data.wk_itd}명</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>복지정보운영본부</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[5]}  외    ${data.wk_wio}명</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>복지정보관리본부</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[6]}  외    ${data.wk_wim}명</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:161;height:33;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>희망복지본부</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:33;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[7]}  외    ${data.wk_hwd}명</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:161;height:32;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>사회보장정보연구소</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:190;height:32;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='font-size:12.0pt;line-height:100%'>${listDeptNum[8]}  외    ${data.wk_sii}명</SPAN></P>
	</TD>
</TR>
</TABLE></P>
<P CLASS=HStyle0 STYLE='margin-left:11.1pt;text-align:center;text-indent:-11.1pt;'></P>

</BODY>

</HTML>

