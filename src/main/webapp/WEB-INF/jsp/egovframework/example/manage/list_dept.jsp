<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
        //submit
        function checkForm() {
               //값에 대한 검사 : 브라우저 내부에서...
               if(document.updateDeptForm.name.value == ""){
                       alert("부서이름이 없습니다.");
                       return false;          //onsubmit의 경우 return false를 줘야지 전달을 하지 않음!
               }       
        }
	</script>
</head>
<body>

	<h2>개인 정보 입력</h2>
		<%String context = request.getContextPath();%>
        <form name="updateDeptForm" method="post" action="<%=context%>/updateDeptCheck.do" onsubmit="return checkForm()">    

        <!-- onsubmit : <input type="submit" /> 이 작동할때 검사-->
                         부서이름 : <input type="text" name="name" value="kakaka" /><br />
               <input type="submit" value="확인(submit)" />
               <input type="reset" value="취소" />
        </form>

</html>