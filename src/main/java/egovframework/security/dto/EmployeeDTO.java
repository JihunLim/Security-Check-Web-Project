package egovframework.security.dto;

public class EmployeeDTO {
	/**
	 * @param emp_email : 회원 이메일 (기본키)
	 * @param emp_name : 회원 이름
	 * @param emp_pwd : 회원 비밀번호
	 * @param deptcode : 회원 부서번호 (외래키)
	 * @param emp_emp_sex : 회원 성별 (male / female)
	 * @param emp_phone : 회원 전화번호
	 * @param emp_watchkeeping : 회원 당직여부 (y / n)
	 * @param emp_role : 회원 권환 (ROLE_USER / ROLE_ADMIN)
	 */
	private String emp_email;
	private String emp_name;
	private String emp_pwd;
	private int emp_deptcode;
	private String emp_sex; //M or F
	private String emp_phone;
	private String emp_watchkeeping;
	private String emp_role;
	private Boolean emp_enabled;
	
	public EmployeeDTO(){
		
	}
	
	public EmployeeDTO(String emp_email){
		this.emp_email = emp_email;
	}
	
	/**
	 * @param emp_email
	 * @param emp_name
	 * @param emp_pwd
	 * @param emp_deptcode
	 * @param emp_sex
	 * @param emp_phone
	 * @param emp_watchkeeping
	 * @param emp_role
	 */
	public EmployeeDTO(String emp_email, String emp_name, String emp_pwd,
			int emp_deptcode, String emp_sex, String emp_phone,
			String emp_watchkeeping, String emp_role) {
		super();
		this.emp_email = emp_email;
		this.emp_name = emp_name;
		this.emp_pwd = emp_pwd;
		this.emp_deptcode = emp_deptcode;
		this.emp_sex = emp_sex;
		this.emp_phone = emp_phone;
		this.emp_watchkeeping = emp_watchkeeping;
		this.emp_role = emp_role;
	}
	
	

	/**
	 * @param emp_email
	 * @param emp_name
	 * @param emp_pwd
	 * @param emp_deptcode
	 * @param emp_sex
	 * @param emp_phone
	 * @param emp_watchkeeping
	 * @param emp_role
	 * @param emp_enabled
	 */
	public EmployeeDTO(String emp_email, String emp_name, String emp_pwd,
			int emp_deptcode, String emp_sex, String emp_phone,
			String emp_watchkeeping, String emp_role, Boolean emp_enabled) {
		super();
		this.emp_email = emp_email;
		this.emp_name = emp_name;
		this.emp_pwd = emp_pwd;
		this.emp_deptcode = emp_deptcode;
		this.emp_sex = emp_sex;
		this.emp_phone = emp_phone;
		this.emp_watchkeeping = emp_watchkeeping;
		this.emp_role = emp_role;
		this.emp_enabled = emp_enabled;
	}

	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_pwd() {
		return emp_pwd;
	}
	public void setEmp_pwd(String emp_pwd) {
		this.emp_pwd = emp_pwd;
	}
	public int getEmp_deptcode() {
		return emp_deptcode;
	}
	public void setEmp_deptcode(int dept_code) {
		this.emp_deptcode = dept_code;
	}
	public String getEmp_sex() {
		return emp_sex;
	}
	public void setEmp_sex(String emp_sex) {
		this.emp_sex = emp_sex;
	}
	public String getEmp_phone() {
		return emp_phone;
	}
	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}

	public String getEmp_watchkeeping() {
		return emp_watchkeeping;
	}

	public void setEmp_watchkeeping(String emp_watchkeeping) {
		this.emp_watchkeeping = emp_watchkeeping;
	}

	public String getEmp_role() {
		return emp_role;
	}

	public void setEmp_role(String emp_role) {
		this.emp_role = emp_role;
	}

	public Boolean getEmp_enabled() {
		return emp_enabled;
	}

	public void setEmp_enabled(Boolean emp_enabled) {
		this.emp_enabled = emp_enabled;
	}
	
	
}
