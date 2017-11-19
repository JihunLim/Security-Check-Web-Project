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

<P CLASS=HStyle0>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<TR>
	<TD colspan="18" valign="middle" style='width:640;height:38;border-left:none;border-right:none;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0><SPAN STYLE='font-family:"휴먼명조";letter-spacing:-5%'>[별지 제3호서식]</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="18" valign="middle" style='width:640;height:73;border-left:none;border-right:none;border-top:none;border-bottom:none;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle16 STYLE='margin-left:26.8pt;text-indent:-26.8pt;line-height:200%;'><SPAN STYLE='font-size:20.0pt;font-family:"휴먼명조";font-weight:bold;line-height:200%'>보 안 점 검 표</SPAN><SPAN STYLE='font-size:15.0pt;font-family:"휴먼명조";font-weight:bold;line-height:200%'>(제8조 관련)</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="13" valign="middle" style='width:491;height:40;border-left:none;border-right:none;border-top:none;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle16 STYLE='margin-left:26.8pt;text-align:right;text-indent:-26.8pt;line-height:180%;'><SPAN STYLE='font-size:13.0pt;font-family:"휴먼명조";line-height:180%'>본부명:&nbsp; </SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:149;height:40;border-left:none;border-right:none;border-top:none;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle16 STYLE='margin-left:26.8pt;text-align:left;text-indent:-26.8pt;line-height:180%;'><SPAN STYLE='font-size:13.0pt;font-family:"휴먼명조";line-height:180%'>AAA</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="3" valign="middle" style='width:62;height:177;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;&nbsp;&nbsp;구</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>&nbsp;&nbsp;&nbsp;분</P>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	<P CLASS=HStyle0 STYLE='text-align:right;line-height:100%;'>&nbsp;</P>
	<P CLASS=HStyle0 STYLE='text-align:right;line-height:100%;'>&nbsp;</P>
	<P CLASS=HStyle0 STYLE='text-align:right;line-height:100%;'>&nbsp;</P>
	<P CLASS=HStyle0 STYLE='text-align:left;line-height:100%;'>&nbsp;&nbsp;점</P>
	<P CLASS=HStyle0 STYLE='text-align:left;line-height:100%;'>&nbsp;&nbsp;검</P>
	<P CLASS=HStyle0 STYLE='text-align:left;line-height:100%;'>&nbsp;&nbsp;일</P>
	</TD>
	<TD rowspan="2" colspan="2" valign="middle" style='width:72;height:89;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>①</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='letter-spacing:50%'>서류보관상태</SPAN></P>
	</TD>
	<TD rowspan="2" colspan="2" valign="middle" style='width:72;height:89;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>②</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>청소상태</P>
	</TD>
	<TD rowspan="2" colspan="2" valign="middle" style='width:72;height:89;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>③</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>소등상태</P>
	</TD>
	<TD rowspan="2" colspan="2" valign="middle" style='width:72;height:89;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>④</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='letter-spacing:50%'>화기단속상태</SPAN></P>
	</TD>
	<TD rowspan="2" colspan="2" valign="middle" style='width:72;height:89;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>⑤</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>문단속상태</P>
	</TD>
	<TD rowspan="3" valign="middle" style='width:36;height:177;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>⑥</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'><SPAN STYLE='letter-spacing:50%'>비고</SPAN></P>
	</TD>
	<TD colspan="5" valign="middle" style='width:144;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>점검시각 및 점검자</P>
	</TD>
	<TD rowspan="3" valign="middle" style='width:37;height:177;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>결재</P>
	</TD>
</TR>
<TR>
	<TD colspan="3" valign="middle" style='width:72;height:53;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>최종퇴청자</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:72;height:53;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>당직근무자</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>최</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>종</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>퇴</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>청</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>당</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>직</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>근</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>무</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>최</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>종</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>퇴</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>청</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>당</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>직</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>근</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>무</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>최</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>종</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>퇴</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>청</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>당</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>직</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>근</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>무</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>최</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>종</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>퇴</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>청</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>당</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>직</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>근</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>무</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>최</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>종</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>퇴</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>청</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>당</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>직</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>근</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>무</P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>자</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>점검시각</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>성명</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>점검시각</P>
	</TD>
	<TD valign="middle" style='width:36;height:88;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:100%;'>성명</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>BBB</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>CCC</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>DDD</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>EEE</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>FFF</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>GGG</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>HHH</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>III</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>JJJ</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>KKK</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>LLL</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>MM</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>NNN</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>OOO</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>PPP</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>QQQ</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>RRR</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>SSS</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>TTT</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>UUU</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>VVV</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>WW</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>XX</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>YY</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ1</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ2</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ3</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ4</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ5</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ6</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ7</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ8</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>ZZ9</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:37;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:37;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:44;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:44;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:36;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:36;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
<TR>
	<TD valign="middle" style='width:62;height:45;border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD colspan="2" valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:36;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
	<TD valign="middle" style='width:37;height:45;border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='line-height:100%;'>&nbsp;</P>
	</TD>
</TR>
</TABLE></P>
<P CLASS=HStyle0></P>

</BODY>

</HTML>
