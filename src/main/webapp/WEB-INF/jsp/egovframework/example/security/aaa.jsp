<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
 
 
//******************************MS excel******************************
 
    // MS excel로 다운로드/실행, filename에 저장될 파일명을 적어준다.
 
   // response.setHeader("Content-Disposition","attachment;filename=member.xls");
 
  //  response.setHeader("Content-Description", "JSP Generated Data");
 
     
 
    // ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
 
//  response.setContentType("application/vnd.ms-excel");
 
//*********************************************************************
 
 
 
//******************************MS word********************************
 
    // MS word로 다운로드/실행, filename에 저장될 파일명을 적어준다.
 
//  response.setHeader("Content-Disposition", "attachment;filename=member.doc");
 
//  response.setHeader("Content-Description", "JSP Generated Data");
 
     
 
    // ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
 
//  response.setContentType("application/vnd.ms-word");
 
//*********************************************************************
 
     
 
     
 
//******************************한글(hwp)********************************
 
    // 한글(hwp)로 다운로드/실행, filename에 저장될 파일명을 적어준다.
 
  response.setHeader("Content-Disposition", "attachment;filename=member.hwp");
 
  response.setHeader("Content-Description", "JSP Generated Data");
 
  
 
    // ↓ 이걸 풀어주면 열기/저장 선택창이 뜨는 게 아니라 그냥 바로 저장된다.
 
//  response.setContentType("application/hwp");
 
//*********************************************************************
 
 
%>
 
</head>
<body>
<h3>회원 목록</h3>
 
 
    <table border="1">
 
        <tbody>
   
   <tr>
        <th rowspan="2">이름</th>
        <td>김근홍aaaaa</td>
        <td>★</td>
      </tr>
      <tr>
        <td colspan="2">김미선</td>
      </tr>
      <tr>
        <th rowspan="2">나이</th>
        <td colspan="2" style='mso-number-format: "@";'>20</td>
      </tr>
      <tr>
        <td>21</td>
        <td>sfsfsfsfㄴㄴㄴ</td>
      </tr>
 
        </tbody>
 
    </table>
 

</body>
</html>