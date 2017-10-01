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
               if(document.officeSecurityFNForm.name.value == ""){
                       alert("부서이름이 없습니다.");
                       return false;          //onsubmit의 경우 return false를 줘야지 전달을 하지 않음!
               }       
        }
	</script>
</head>
<body>

	<h2>사무실 보안점검</h2>
	<h4>(당직근무자 용)</h4>
		<%String context = request.getContextPath();%>
        <form name="officeSecurityFNForm" method="post" action="<%=context%>/officeSecurityFNCheck.do" onsubmit="return checkForm()">    

        <!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->
            
                       <input type="hidden" name="os_empemail" value=<s:authentication property="name"/>><br /> 
                         부서번호 : <select name="os_deptcode">
						  <option value="1">경영기획본부</option>
						  <option value="2">보건의료본부</option>
						  <option value="3">고객지원본부</option>
						  <option value="4">정보기술본부</option>
						  <option value="5">희망복지중앙지원단</option>
						  <option value="6">정보개발본부</option>
						  <option value="7">복지정보본부</option>
						  <option value="8">바우처관리본부</option>
						  <option value="9">사회보장정보연구소</option>
					  </select><br /><br />  
					  
                         서류보관상태 : 미흡<input type="radio" name="os_document" value="0">
 		                              보통<input type="radio" name="os_document" value="1">
 		                              양호<input type="radio" name="os_document" value="2"><br /><br />   
 		                           
                         청소상태 :  미흡<input type="radio" name="os_clean" value="0">
 		                           보통<input type="radio" name="os_clean" value="1">
 		                           양호<input type="radio" name="os_clean" value="2"><br /><br />          

                         소등상태 : 미흡<input type="radio" name="os_lightout" value="0">
 		                           보통<input type="radio" name="os_lightout" value="1">
 		                           양호<input type="radio" name="os_lightout" value="2"><br /><br />    
 		                           
                         환기상태 : 미흡<input type="radio" name="os_ventilation" value="0">
 		                           보통<input type="radio" name="os_ventilation" value="1">
 		                           양호<input type="radio" name="os_ventilation" value="2"><br /><br />  
 		                             
                           문단속 : 미흡<input type="radio" name="os_door" value="0">
 		                           보통<input type="radio" name="os_door" value="1">
 		                           양호<input type="radio" name="os_door" value="2"><br /><br />    
 		                           
                           비고 <br />
                         <textarea rows="5" cols="30" name="os_etc"></textarea><br /><br /> 
                           
               <input type="submit" value="확인" />
               <input type="reset" value="취소" />
        </form>

</html>