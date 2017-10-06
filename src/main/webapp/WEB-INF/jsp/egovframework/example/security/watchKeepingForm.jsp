<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%String cp= request.getContextPath(); %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>

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
	<!-- 상단 메뉴 바 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
  		<div class="container-fluid" role="form">
  		
    		<div class="col-md-3">
     	 		<a class="navbar-brand" href="#">Office Security Management System</a>
    		</div>
    		<div class="col-md-6">
    		<ul class="nav navbar-nav">
      		<li><a color:#FFFFF> ${deptName}  ${emp_name} (${auth})님 안녕하세요. <br/></li>
    		</ul>
    		</div>
    		<ul class="nav navbar-nav navbar-right">
      		<li><a href="${pageContext.request.contextPath}/j_spring_security_logout"><span class="glyphicon glyphicon-log-in"></span>Log Out</a></li>
    		</ul>
  		</div>
	</nav>
	
	
	<h2>당직점검일지</h2>
		<%String context = request.getContextPath();%>
        <form name="watchKeepingForm" method="post" action="<%=context%>/watchKeepingCheck.do" onsubmit="return checkForm()">    

        <!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->
            
                         <input type="hidden" name="wk_empemail" value=<s:authentication property="name"/>><br /><br />
                         지시사항 <br />
              <textarea rows="5" cols="30" name="wk_indication"></textarea><br /><br /> 
                         조치사항<br />
              <textarea rows="5" cols="30" name="wk_measure"></textarea><br /><br /> 
                         순찰 중 각 부서 근무자 현황<br />
		           경영지원본부 : <input type="number" name="wk_mpd" value="" /><br /> 
		           바우처본부 : <input type="number" name="wk_vmd" value="" /><br /> 
		           보건의료본부 : <input type="number" name="wk_hmd" value="" /><br /> 
		           고객지원본부 : <input type="number" name="wk_csd" value="" /><br /> 
		           정보기술본부 : <input type="number" name="wk_itd" value="" /><br /> 
	                  복지정보운영본부 : <input type="number" name="wk_wio" value="" /><br /> 
	                  복지정보관리본부 : <input type="number" name="wk_wim" value="" /><br /> 
		           희망복지본부 : <input type="number" name="wk_hwd" value="" /><br />
		           사회보장정보연구소 : <input type="number" name="wk_sii" value="" /><br /><br />
		               
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
