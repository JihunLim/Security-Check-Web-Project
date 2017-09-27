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
               if(document.watchKeepingForm.name.value == ""){
                       alert("부서이름이 없습니다.");
                       return false;          //onsubmit의 경우 return false를 줘야지 전달을 하지 않음!
               }       
        }
	</script>
</head>
<body>

	<h2>당직점검일지</h2>
		<%String context = request.getContextPath();%>
        <form name="watchKeepingForm" method="post" action="<%=context%>/watchKeepingCheck.do" onsubmit="return checkForm()">    

        <!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->
            
                         사원번호 : 클라쪽에서 알아서 보냄 <input type="text" name="wk_empemail" value=<s:authentication property="name"/>><br /><br />
                         지시사항 <br />
              <textarea rows="5" cols="30" name="wk_indication"></textarea><br /><br /> 
                         조치사항<br />
              <textarea rows="5" cols="30" name="wk_measure"></textarea><br /><br /> 
                         순찰 중 각 부서 근무자 현황<br />
              a부서 : <input type="number" name="wk_na" value="" /><br /> 
              b부서 : <input type="number" name="wk_nb" value="" /><br /> 
              c부서 : <input type="number" name="wk_nc" value="" /><br /> 
              d부서 : <input type="number" name="wk_nd" value="" /><br /> 
              e부서 : <input type="number" name="wk_ne" value="" /><br /> 
              f부서 : <input type="number" name="wk_nf" value="" /><br /> 
              g부서 : <input type="number" name="wk_ng" value="" /><br /> 
              h부서 : <input type="number" name="wk_nh" value="" /><br />
              i부서 : <input type="number" name="wk_ni" value="" /><br /><br />
               
 		          당직 중 특이사항<br />
 		      <textarea rows="5" cols="30" name="wk_specificity"></textarea><br /><br />
 		          보고사항<br />
 		      <textarea rows="5" cols="30" name="wk_report"></textarea><br /><br />
 		            
 		          인계사항<br />
 		      <textarea rows="5" cols="30" name="wk_delivery"></textarea><br /><br />
 		          
 		       
                        시간 : 서버시간 가져오기 (서버쪽에서)<br /><br />

               <input type="submit" value="확인(submit)" />
               <input type="reset" value="취소" />
        </form>

</html>
