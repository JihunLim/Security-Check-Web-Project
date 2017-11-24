<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
<script type="text/javascript">
$(function() {
    $('.date-picker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yyyy-MM',
        onClose: function(dateText, inst) { 
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            month *= 1;
            month += 1;
            	
            $(this).datepicker('setDate', new Date(year, month, 1));
            location.href="<%=cp%>/insertNightDutyTable.do?month="+year+"-"+month;
        }
    });
});
</script>

 <style>
.ui-datepicker-calendar {
    display: none;
    }
</style>
<!-- Main -->
<div id="main">
	<div class = "main_page"		style="margin:0;">
		<a href="mainmenu.do"><img src= "images/home_logo.PNG" style="float:left; margin:10px 10px -15px 10px; padding-left:20px;"></a>
		<img src= "images/line.png" style="width:100%; height:5px; margin:0px;">
	</div>
   <!-- Intro -->
   <section  class="one dark">
      <div class="container">
         <header>
            <h2>당직근무표 생성하기</h2>
         </header>
      </div>
      </section>
      
      <!-- Single button -->
   <div class="container">
      <div class="btn-group">
         <div class="row">
            <div class="12u$ 12u$(mobile)" style="float:left;font-size:0.8em">
               	년월로 검색 : <input name="month" class="date-picker" style="font-size: 0.8em;height: 2em;width:10em;"/>  
            </div>
            
            </div>
      </div>
   </div>
      
      <section class="white">
         <div class="container">
         
         	<form method="post" action="<%=cp%>/insertNightDutyCheck.do">
         
            <table width="800" cellpadding="0" cellspacing="0" border="1">
            <tr>
               <td>일시</td>
               <td>당직자 E-mail</td>
            <tr>
               <c:forEach items="${date}" var="dto">           
                  <tr>
                     <td><input type="text" name="nd_date" style="color:#000;border:0px;text-align:center;" value="${dto}" readonly></input></td>
                     <td><input type="text" name="nd_email" style="color:#000;font-size: 1em;border:0px;text-align:center;" placeholder="E-mail을 입력해주세요" required></input></td>
                  <tr>
               </c:forEach>
         </table>
        	<s:authorize access="hasAuthority('ROLE_ADMIN')">
        	<div style="float:right">
        	<button type="submit" class="btn btn-primary">제출하기</button>
			</div>                  
        </s:authorize> 
         </form>
      </div>
   </section>
</div>

<script type="text/javascript">
</script>
<%String cp2= request.getContextPath(); %>
      <!-- Footer -->
         <div id="footer">

            <!-- Copyright -->
               <ul class="copyright">
                  <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
               </ul>

         </div>

      <!-- Scripts -->
         <script src="<%=cp2%>/bootstrap/js/jquery.min.js"></script>
         <script src="<%=cp2%>/bootstrap/js/jquery.scrolly.min.js"></script>
         <script src="<%=cp2%>/bootstrap/js/jquery.scrollzer.min.js"></script>
         <script src="<%=cp2%>/bootstrap/js/skel.min.js"></script>
         <script src="<%=cp2%>/bootstrap/js/util.js"></script>
         <script src="<%=cp2%>/bootstrap/js/main.js"></script>
         <script src="https://use.fontawesome.com/b24720279e.js"></script>
         <script src="<%=cp2%>/bootstrap/js/bootstrap.js"></script>
           <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="http://malsup.github.com/jquery.cycle2.js"></script>
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
       
       
   </body>
</html>
<!-- 끝 -->
<!-- 끝 -->