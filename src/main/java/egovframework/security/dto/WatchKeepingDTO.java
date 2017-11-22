package egovframework.security.dto;

import java.sql.Timestamp;
import java.util.Locale;

public class WatchKeepingDTO {
	private int wk_id;
	private String wk_datetime;
	private String wk_empemail;
	private String wk_indication;
	private String wk_measure;
	private int wk_mpd;
	private int wk_hmd;
	private int wk_csd;
	private int wk_itd;
	private int wk_idd;
	private int wk_wid;
	private int wk_vmd;
	private int wk_vid;
	private int wk_sii;
	private String wk_specificity;
	private String wk_report;
	private String wk_delivery;
	//부서이름을 가져오기 위한 추가속성
	private String deptName;
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
	 * @param wk_mpd
	 * @param wk_hmd
	 * @param wk_csd
	 * @param wk_itd
	 * @param wk_idd
	 * @param wk_wid
	 * @param wk_vmd
	 * @param wk_vid
	 * @param wk_sii
	 * @param wk_specificity
	 * @param wk_report
	 * @param wk_delivery
	 */
	public WatchKeepingDTO(String wk_empemail, String wk_indication,
			String wk_measure, int wk_mpd, int wk_hmd, int wk_csd, int wk_itd,
			int wk_idd, int wk_wid, int wk_vmd, int wk_vid, int wk_sii,
			String wk_specificity, String wk_report, String wk_delivery) {
		super();
		this.wk_empemail = wk_empemail;
		this.wk_indication = wk_indication;
		this.wk_measure = wk_measure;
		this.wk_mpd = wk_mpd;
		this.wk_hmd = wk_hmd;
		this.wk_csd = wk_csd;
		this.wk_itd = wk_itd;
		this.wk_idd = wk_idd;
		this.wk_wid = wk_wid;
		this.wk_vmd = wk_vmd;
		this.wk_vid = wk_vid;
		this.wk_sii = wk_sii;
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

	public int getWk_mpd() {
		return wk_mpd;
	}

	public void setWk_mpd(int wk_mpd) {
		this.wk_mpd = wk_mpd;
	}

	public int getWk_hmd() {
		return wk_hmd;
	}

	public void setWk_hmd(int wk_hmd) {
		this.wk_hmd = wk_hmd;
	}

	public int getWk_csd() {
		return wk_csd;
	}

	public void setWk_csd(int wk_csd) {
		this.wk_csd = wk_csd;
	}

	public int getWk_itd() {
		return wk_itd;
	}

	public void setWk_itd(int wk_itd) {
		this.wk_itd = wk_itd;
	}

	public int getWk_idd() {
		return wk_idd;
	}

	public void setWk_idd(int wk_idd) {
		this.wk_idd = wk_idd;
	}

	public int getWk_wid() {
		return wk_wid;
	}

	public void setWk_wid(int wk_wid) {
		this.wk_wid = wk_wid;
	}

	public int getWk_vmd() {
		return wk_vmd;
	}

	public void setWk_vmd(int wk_vmd) {
		this.wk_vmd = wk_vmd;
	}

	public int getWk_vid() {
		return wk_vid;
	}

	public void setWk_vid(int wk_vid) {
		this.wk_vid = wk_vid;
	}

	public int getWk_sii() {
		return wk_sii;
	}

	public void setWk_sii(int wk_sii) {
		this.wk_sii = wk_sii;
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
		return (wk_mpd+wk_hmd+wk_csd+wk_itd+wk_idd+wk_wid+wk_vmd+wk_vid+wk_sii)/9;
	}

	public String getEmp_rank() {
		return emp_rank;
	}
	
	
}
