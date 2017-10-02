package egovframework.security.dto;

public class DeptDTO {
	private int deptNo;
	private String deptName;
	private int deptNum;
	
	public DeptDTO(){
		
	}
	
	public DeptDTO(String deptName){
		this.deptName = deptName;
	}
	
	public DeptDTO(int deptNo){
		this.deptNo = deptNo;
	}
	
	public DeptDTO(int deptNo, int deptNum){
		this.deptNo = deptNo;
		this.deptNum = deptNum;
	}
	
	/**
	 * @param deptNo
	 * @param deptName
	 */
	public DeptDTO(int deptNo, String deptName) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
	}

	/**
	 * @param deptNo
	 * @param deptName
	 * @param deptNum
	 */
	public DeptDTO(int deptNo, String deptName, int deptNum) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.deptNum = deptNum;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getDeptNum() {
		return deptNum;
	}

	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}
	
}
