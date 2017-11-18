<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script>
function print(printArea)
{
		win = window.open(); 
		self.focus(); 
		win.document.open();
		/*
			1. div 안의 모든 태그들을 innerHTML을 사용하여 매개변수로 받는다.
			2. window.open() 을 사용하여 새 팝업창을 띄운다.
			3. 열린 새 팝업창에 기본 <html><head><body>를 추가한다.
			4. <body> 안에 매개변수로 받은 printArea를 추가한다.
			5. window.print() 로 인쇄
			6. 인쇄 확인이 되면 팝업창은 자동으로 window.close()를 호출하여 닫힘
		*/
		win.document.write('<html><'head'><title></title><style>');
		win.document.write('body, td {font-falmily: Verdana; font-size: 10pt;}');
		win.document.write('</style></haed><body>');
		win.document.write(printArea);
 		win.document.write('</body></html>');
		win.document.close();
		win.print();
		win.close();
}
</script>
			
			
	</body>
</html>