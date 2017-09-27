package egovframework.security.dto;

public class EmployeeDTO {
	private String emp_email;
	private String emp_name;
	private String emp_pwd;
	private int emp_deptcode;
	private String emp_sex; //M or F
	private String emp_phone;
	
	
	public EmployeeDTO(String emp_email){
		
		this.emp_email = emp_email;
	}
	/**
	 * @param emp_email
	 * @param emp_name
	 * @param emp_pwd
	 * @param deptcode
	 * @param emp_emp_sex
	 * @param emp_phone
	 */
	public EmployeeDTO(String emp_email, String emp_name, String emp_pwd,
			int emp_deptcode, String emp_sex, String emp_phone) {
		super();
		this.emp_email = emp_email;
		this.emp_name = emp_name;
		this.emp_pwd = emp_pwd;
		this.emp_deptcode = emp_deptcode;
		this.emp_sex = emp_sex;
		this.emp_phone = emp_phone;
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
	
	

	
}
