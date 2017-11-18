package egovframework.security.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Locale;

public class NightDutyDTO {
	private String nd_date;
	private String nd_empemail;
	//회원정보를 가져오기 위한 추가속성
	private String deptName;
	private String emp_rank;
	private String emp_name;
	
	public NightDutyDTO(){
		
	}
	/**
	 * @param nd_date
	 * @param nd_empemail
	 */
	public NightDutyDTO(String nd_date, String nd_empemail) {
		super();
		this.nd_date = nd_date;
		this.nd_empemail = nd_empemail;
	}
	
	/**
	 * @param nd_date
	 * @param nd_empemail
	 * @param deptName
	 * @param emp_rank
	 * @param emp_name
	 */
	public NightDutyDTO(String nd_date, String nd_empemail, String deptName,
			String emp_rank, String emp_name) {
		super();
		this.nd_date = nd_date;
		this.nd_empemail = nd_empemail;
		this.deptName = deptName;
		this.emp_rank = emp_rank;
		this.emp_name = emp_name;
	}


	public String getNd_date() {
		return nd_date;
	}
	public void setNd_date(Date nd_date) {
		try {
			  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd (EEE)",Locale.KOREAN);
			  this.nd_date = formatter.format(nd_date);
			} catch (Exception ex) {
				this.nd_date = "date is not available";
			}
	}
	public String getNd_empemail() {
		return nd_empemail;
	}
	public void setNd_empemail(String nd_empemail) {
		this.nd_empemail = nd_empemail;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
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
