<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/menu/topMenu.jsp"%>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
<script type="text/javascript">
$(function() {
    $('.date-picker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yy-mm',
        onClose: function(dateText, inst) { 
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            month *= 1;
            month += 1;
            $(this).datepicker('setDate', new Date(year, month, 1));
            location.href="<%=cp%>/nightDutyTable.do?month="+year+"-"+month;
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
   <!-- Intro -->
   <section  class="one dark">
      <div class="container">
         <header>
            <h2>당직근무 테이블</h2>
         </header>
      </div>
      </section>
      
      <!-- Single button -->
   <div class="container">
      <div class="btn-group">
         <div class="row">
            <div class="6u 12u$(mobile)">
                  년월로 검색 : <input name="month" class="date-picker" />  
            </div>
            
            <div class="6u 12u$(mobile)">
               <input type="checkbox" value="nightDutyTable.do?month=1" onchange="if(this.value) location.href=(this.value);">나의 당직표 확인
            </div>
            
            </div>
      </div>
   </div>
      
      <section class="white">
         <div class="container">
            <table width="800" cellpadding="0" cellspacing="0" border="1">
            <tr>
               <td>일시</td>
               <td>당직자 부서</td>
               <td>당직자 이름</td>
            <tr>
               <c:forEach items="${list}" var="dto">           
                  <tr <c:if test="${dto.nd_date eq today}"> bgcolor = "#C8FAC8" </c:if>>
                     <td>${dto.nd_date}</td>
                     <td>${dto.deptName}</td>
                     <td>${dto.emp_name}</td>
                  <tr>
               </c:forEach>
         </table>
      
      	<div style="float:right">
		<a href="officeSecurityChoice.do" class="button">당직근무 수정하기</a>
		</div>
	  
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