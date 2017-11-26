package egovframework.security.dto;

import java.sql.Timestamp;
import java.util.Locale;

public class WatchKeepingDTO {
	private int wk_id;
	private String wk_datetime;
	private String wk_empemail;
	private String wk_indication;
	private String wk_measure;
	private int wk_dp1;
	private int wk_dp2;
	private int wk_dp3;
	private int wk_dp4;
	private int wk_dp5;
	private int wk_dp6;
	private int wk_dp7;
	private int wk_dp8;
	private int wk_dp9; 
	private int wk_dp10;
	private String wk_specificity;
	private String wk_report;
	private String wk_delivery;
	//부서이름을 가져오기 위한 추가속성
	private String deptName;
	private int deptNo;
	private String emp_name;
	private String emp_rank;
	//평균 보안점수
	private int avg_score;

	public WatchKeepingDTO(){
		
	}

	/**
	 * @param wk_empemail
	 * @param wk_indication
	 * @param wk_measure
	 * @param wk_dp1
	 * @param wk_dp2
	 * @param wk_dp3
	 * @param wk_dp4
	 * @param wk_dp5
	 * @param wk_dp6
	 * @param wk_dp7
	 * @param wk_dp8
	 * @param wk_dp9
	 * @param wk_dp10
	 * @param wk_specificity
	 * @param wk_report
	 * @param wk_delivery
	 */
	public WatchKeepingDTO(String wk_empemail, String wk_indication,
			String wk_measure, int wk_dp1, int wk_dp2, int wk_dp3, int wk_dp4,
			int wk_dp5, int wk_dp6, int wk_dp7, int wk_dp8, int wk_dp9,
			int wk_dp10, String wk_specificity, String wk_report,
			String wk_delivery) {
		super();
		this.wk_empemail = wk_empemail;
		this.wk_indication = wk_indication;
		this.wk_measure = wk_measure;
		this.wk_dp1 = wk_dp1;
		this.wk_dp2 = wk_dp2;
		this.wk_dp3 = wk_dp3;
		this.wk_dp4 = wk_dp4;
		this.wk_dp5 = wk_dp5;
		this.wk_dp6 = wk_dp6;
		this.wk_dp7 = wk_dp7;
		this.wk_dp8 = wk_dp8;
		this.wk_dp9 = wk_dp9;
		this.wk_dp10 = wk_dp10;
		this.wk_specificity = wk_specificity;
		this.wk_report = wk_report;
		this.wk_delivery = wk_delivery;
	}

	public int getWk_id() {
		return wk_id;
	}

	public void setWk_id(int wk_id) {
		this.wk_id = wk_id;
	}

	public String getWk_datetime() {
		return wk_datetime;
	}

	public void setWk_datetime(Timestamp wk_datetime) {
		try {
			  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd(EEE) HH:mm:ss",Locale.KOREAN);
			  this.wk_datetime = formatter.format(wk_datetime);
			} catch (Exception ex) {
				this.wk_datetime = "";
			}
	}

	public String getWk_empemail() {
		return wk_empemail;
	}

	public void setWk_empemail(String wk_empemail) {
		this.wk_empemail = wk_empemail;
	}

	public String getWk_indication() {
		return wk_indication;
	}

	public void setWk_indication(String wk_indication) {
		this.wk_indication = wk_indication;
	}

	public String getWk_measure() {
		return wk_measure;
	}

	public void setWk_measure(String wk_measure) {
		this.wk_measure = wk_measure;
	}

	public int getwk_dp1() {
		return wk_dp1;
	}

	public void setwk_dp1(int wk_dp1) {
		this.wk_dp1 = wk_dp1;
	}

	public int getwk_dp2() {
		return wk_dp2;
	}

	public void setwk_dp2(int wk_dp2) {
		this.wk_dp2 = wk_dp2;
	}

	public int getwk_dp3() {
		return wk_dp3;
	}

	public void setwk_dp3(int wk_dp3) {
		this.wk_dp3 = wk_dp3;
	}

	public int getwk_dp4() {
		return wk_dp4;
	}

	public void setwk_dp4(int wk_dp4) {
		this.wk_dp4 = wk_dp4;
	}

	public int getwk_dp5() {
		return wk_dp5;
	}

	public void setwk_dp5(int wk_dp5) {
		this.wk_dp5 = wk_dp5;
	}

	public int getwk_dp6() {
		return wk_dp6;
	}

	public void setwk_dp6(int wk_dp6) {
		this.wk_dp6 = wk_dp6;
	}

	public int getwk_dp7() {
		return wk_dp7;
	}

	public void setwk_dp7(int wk_dp7) {
		this.wk_dp7 = wk_dp7;
	}

	public int getwk_dp8() {
		return wk_dp8;
	}

	public void setwk_dp8(int wk_dp8) {
		this.wk_dp8 = wk_dp8;
	}

	public int getwk_dp9() {
		return wk_dp9;
	}

	public void setwk_dp9(int wk_dp9) {
		this.wk_dp9 = wk_dp9;
	}
	
	public int getWk_dp10() {
		return wk_dp10;
	}

	public void setWk_dp10(int wk_dp10) {
		this.wk_dp10 = wk_dp10;
	}

	public String getWk_specificity() {
		return wk_specificity;
	}

	public void setWk_specificity(String wk_specificity) {
		this.wk_specificity = wk_specificity;
	}

	public String getWk_report() {
		return wk_report;
	}

	public void setWk_report(String wk_report) {
		this.wk_report = wk_report;
	}

	public String getWk_delivery() {
		return wk_delivery;
	}

	public void setWk_delivery(String wk_delivery) {
		this.wk_delivery = wk_delivery;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public int getAvg_score() {
		return (wk_dp1+wk_dp2+wk_dp3+wk_dp4+wk_dp5+wk_dp6+wk_dp7+wk_dp8+wk_dp9)/9;
	}

	public String getEmp_rank() {
		return emp_rank;
	}

	public int getDeptNo() {
		return deptNo;
	}
	
	
	
}
