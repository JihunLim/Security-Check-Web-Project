package egovframework.security.dto;

public class PagingDTO {
	/*
	 * rows : 한 페이지에 보이는 리스트 갯수
	 * page : 원하는 페이지 번호(=현재 보여지는 페이지 번호)
	 * totalPage : 총 페이지 수 (ceil(총 갯수/rows))
	 * startPage : 시작페이지 번호
	 * endPage : 끝페이지 번호
	 * pageScale : 한 그룹에 속할 수 있는 페이지 번호 갯수(5개가 1그룹)
	 * pageGroup : 해당 페이지가 속해있는 그룹
	 * prePage : 이전페이지가 없으면 0이 출력하게 함
	 * nextPage : 다음 그룸의 페이지를 출력하게 함
	 */
	
	private long rows = 15;
	private long page = 1;
	private long totalPage;
	private long startPage = 1;
	private long endPage;
	private long pageScale = 5;
	private long pageGroup;
	private long prePage;
	private long nextPage;
	
	
	public PagingDTO(long _totalPage, long _page){
		pageGroup = (long)Math.ceil((double)page/pageScale);
		startPage = (pageGroup - 1) * pageScale + 1;
		endPage = startPage + pageScale - 1;
		prePage = (pageGroup-2) * pageScale + 1;
		nextPage = pageGroup * pageScale + 1;
		totalPage = (long)Math.ceil((double)_totalPage/(double)15);
		page = _page;
	}
	
	
	public long getRows() {
		return rows;
	}
	public void setRows(long rows) {
		this.rows = rows;
	}
	public long getPage() {
		return page;
	}
	public void setPage(long page) {
		this.page = page;
	}
	public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
	public long getStartPage() {
		return startPage;
	}
	public void setStartPage(long startPage) {
		this.startPage = startPage;
	}
	public long getEndPage() {
		return endPage;
	}
	public void setEndPage(long endPage) {
		this.endPage = endPage;
	}
	public long getPageScale() {
		return pageScale;
	}
	public void setPageScale(long pageScale) {
		this.pageScale = pageScale;
	}
	public long getPageGroup() {
		return pageGroup;
	}
	public void setPageGroup(long pageGroup) {
		this.pageGroup = pageGroup;
	}
	public long getPrePage() {
		return prePage;
	}
	public void setPrePage(long prePage) {
		this.prePage = prePage;
	}
	public long getNextPage() {
		return nextPage;
	}
	public void setNextPage(long nextPage) {
		this.nextPage = nextPage;
	}
	
	
	
	
}
