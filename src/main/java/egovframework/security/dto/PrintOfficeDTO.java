package egovframework.security.dto;

import java.util.Locale;

public class PrintOfficeDTO {
	private int os_document;
	private int os_clean;
	private int os_lightout;
	private int os_ventilation;
	private int os_door;
	private String os_etc;
	private String os_datetime;
	private String deptName;
	private String emp_name;
	private String wk_datetime;
	//For String
	private String str_document;
	private String str_clean;
	private String str_lightout;
	private String str_ventilation;
	private String str_door;
	private String str_date_off;
	private String str_time_off;
	private String str_time_nd;
	
	
	public String getStr_date_off() {
		return os_datetime.substring(0,10);
	}


	public String getStr_time_off() {
		return os_datetime.substring(10,19);
	}
	
	public String getStr_time_nd() {
		return wk_datetime.substring(10,19);
	}


	public PrintOfficeDTO(){	
	}
	
	
	public int getOs_document() {
		return os_document;
	}




	public void setOs_document(int os_document) {
		this.os_document = os_document;
	}




	public int getOs_clean() {
		return os_clean;
	}




	public void setOs_clean(int os_clean) {
		this.os_clean = os_clean;
	}




	public int getOs_lightout() {
		return os_lightout;
	}




	public void setOs_lightout(int os_lightout) {
		this.os_lightout = os_lightout;
	}




	public int getOs_ventilation() {
		return os_ventilation;
	}




	public void setOs_ventilation(int os_ventilation) {
		this.os_ventilation = os_ventilation;
	}




	public int getOs_door() {
		return os_door;
	}




	public void setOs_door(int os_door) {
		this.os_door = os_door;
	}




	public String getOs_etc() {
		return os_etc;
	}




	public void setOs_etc(String os_etc) {
		this.os_etc = os_etc;
	}




	public String getOs_datetime() {
		return os_datetime;
		
	}




	public void setOs_datetime(String os_datetime) {
		this.os_datetime = os_datetime;
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




	public String getWk_datetime() {
		return wk_datetime;
	}




	public void setWk_datetime(String wk_datetime) {
		this.wk_datetime = wk_datetime;
	}




	public String getStr_document() {
		if (os_document == 0)
			return "미흡";
		else if (os_document == 1)
			return "보통";
		else
			return "양호";
	}

	public String getStr_clean() {
		if (os_clean == 0)
			return "미흡";
		else if (os_clean == 1)
			return "보통";
		else
			return "양호";
	}

	public String getStr_lightout() {
		if (os_lightout == 0)
			return "미흡";
		else if (os_lightout == 1)
			return "보통";
		else
			return "양호";
	}

	public String getStr_ventilation() {
		if (os_ventilation == 0)
			return "미흡";
		else if (os_ventilation == 1)
			return "보통";
		else
			return "양호";
	}

	public String getStr_door() {
		if (os_door == 0)
			return "미흡";
		else if (os_door == 1)
			return "보통";
		else
			return "양호";
	}
}
