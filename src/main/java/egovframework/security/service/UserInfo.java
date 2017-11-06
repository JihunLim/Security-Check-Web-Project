package egovframework.security.service;

public class UserInfo {
	private int os_deptcode;
	private String deptName;
	private String emp_name;
	private String emp_role;
	private String emp_rank;
	private String auth;
	
	
	public UserInfo(){
		
	}

	/**
	 * @param os_deptcode
	 * @param deptName
	 * @param emp_name
	 * @param emp_role
	 * @param emp_rank
	 */
	public UserInfo(int os_deptcode, String deptName, String emp_name,
			String emp_role, String emp_rank) {
		super();
		this.os_deptcode = os_deptcode;
		this.deptName = deptName;
		this.emp_name = emp_name;
		this.emp_role = emp_role;
		this.emp_rank = emp_rank;
	}


	public int getOs_deptcode() {
		return os_deptcode;
	}

	public void setOs_deptcode(int os_deptcode) {
		this.os_deptcode = os_deptcode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getEmp_role() {
		return emp_role;
	}

	public void setEmp_role(String emp_role) {
		this.emp_role = emp_role;
	}

	public String getAuth() {
		if ("ROLE_USER".equals(emp_role))
			this.auth = "일반사용자";
		else 
			this.auth = "관리자";
		
		return auth;
	}

	public String getEmp_rank() {
		return emp_rank;
	}

	public void setEmp_rank(String emp_rank) {
		this.emp_rank = emp_rank;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	
}
