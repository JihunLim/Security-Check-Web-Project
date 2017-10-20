/**
 * 
 */
//경로 가져오기
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

//원하는 페이지로 이동시 검색조건
	function fnGoPaging(page){
		String cp= request.getContextPath(); 
    	location.href=getContextPath()+"/listOfficeSecurity.do?page="+page;
	};