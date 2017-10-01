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
               if(document.addDeptForm.deptName.value == ""){
                       alert("부서이름을 적어주세요.");
                       return false;          //onsubmit의 경우 return false를 줘야지 전달을 하지 않음!
               }       
        }
	</script>
</head>
<body>

	<h2>부서 추가</h2>
	
		<%String context = request.getContextPath();%>
        <form name="addDeptForm" method="post" action="<%=context%>/addDeptCheck.do" onsubmit="return checkForm()">    
	         <!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->
	               추가하려는 부서를 적으세요 : <input type="text" name="deptName" ><br />
	
	        <input type="submit" value="확인" />
	        <input type="reset" value="취소" />
        </form>

</html>