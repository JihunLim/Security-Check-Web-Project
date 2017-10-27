package egovframework.security.dto;

public class DeptDTO {
	private int deptNo;
	private String deptName;
	private int deptNum;
	private String deptBoss;
	
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
	 * @param deptNum
	 * @param deptBoss
	 */
	public DeptDTO(int deptNo, String deptName, int deptNum, String deptBoss) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.deptNum = deptNum;
		this.deptBoss = deptBoss;
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

	public String getDeptBoss() {
		return deptBoss;
	}

	public void setDeptBoss(String deptBoss) {
		this.deptBoss = deptBoss;
	}
	
}
