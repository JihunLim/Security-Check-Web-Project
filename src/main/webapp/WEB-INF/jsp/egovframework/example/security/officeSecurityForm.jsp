<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
        //submit
        function checkForm() {
               //값에 대한 검사 : 브라우저 내부에서...
               if(document.officeSecurityForm.name.value == ""){
                       alert("부서이름이 없습니다.");
                       return false;          //onsubmit의 경우 return false를 줘야지 전달을 하지 않음!
               }       
        }
	</script>
</head>
<body>

	<h2>사무실 보안점검</h2>
		<%String context = request.getContextPath();%>
        <form name="officeSecurityForm" method="post" action="<%=context%>/officeSecurityCheck.do" onsubmit="return checkForm()">    

        <!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->
            
                         사원번호 : 클라쪽에서 알아서 보냄 <input type="text" name="os_empemail" value=<s:authentication property="name"/>><br /> 
                         부서번호 : 로그인정보에서 가져오기(서버쪽에서)<br /> 
                         서류보관상태 : 미흡<input type="radio" name="os_document" value="0">
 		                           보통<input type="radio" name="os_document" value="1">
 		                           양호<input type="radio" name="os_document" value="2"><br />  
 		                           
                         청소상태 :  미흡<input type="radio" name="os_clean" value="0">
 		                           보통<input type="radio" name="os_clean" value="1">
 		                           양호<input type="radio" name="os_clean" value="2"><br />         

                         소등상태 : 미흡<input type="radio" name="os_lightout" value="0">
 		                           보통<input type="radio" name="os_lightout" value="1">
 		                           양호<input type="radio" name="os_lightout" value="2"><br />   
 		                           
                         환기상태 : 미흡<input type="radio" name="os_ventilation" value="0">
 		                           보통<input type="radio" name="os_ventilation" value="1">
 		                           양호<input type="radio" name="os_ventilation" value="2"><br /> 
 		                             
                           문단속 : 미흡<input type="radio" name="os_door" value="0">
 		                           보통<input type="radio" name="os_door" value="1">
 		                           양호<input type="radio" name="os_door" value="2"><br />   
 		                           
                           비고 : <input type="text" name="os_etc" value="" /><br />
                           시간 : 서버시간 가져오기 (서버쪽에서)<br /> 
                          

               <input type="submit" value="확인(submit)" />
               <input type="reset" value="취소" />
        </form>

</html>