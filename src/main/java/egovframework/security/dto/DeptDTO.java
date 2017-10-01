package egovframework.security.dto;

public class DeptDTO {
	private int deptNo;
	private String deptName;
	
	public DeptDTO(){
		
	}
	
	public DeptDTO(String deptName){
		this.deptName = deptName;
	}
	
	public DeptDTO(int deptNo){
		this.deptNo = deptNo;
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

	
	
	
	
	
}
