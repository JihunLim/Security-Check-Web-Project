package egovframework.security.dto;

import java.sql.Timestamp;

public class WatchKeepingDTO {
	private int wk_id;
	private Timestamp wk_datetime;
	private String wk_empemail;
	private String wk_indication;
	private String wk_measure;
	private int wk_mpd;
	private int wk_vmd;
	private int wk_hmd;
	private int wk_csd;
	private int wk_itd;
	private int wk_wio;
	private int wk_wim;
	private int wk_hwd;
	private int wk_sii;
	private String wk_specificity;
	private String wk_report;
	private String wk_delivery;
	//부서이름을 가져오기 위한 추가속성
	private String deptName;

	public WatchKeepingDTO(){
		
	}

	/**
	 * @param wk_id
	 * @param wk_datetime
	 * @param wk_empemail
	 * @param wk_indication
	 * @param wk_measure
	 * @param wk_mpd
	 * @param wk_vmd
	 * @param wk_hmd
	 * @param wk_csd
	 * @param wk_itd
	 * @param wk_wio
	 * @param wk_wim
	 * @param wk_hwd
	 * @param wk_sii
	 * @param wk_specificity
	 * @param wk_report
	 * @param wk_delivery
	 * @param deptName
	 */
	public WatchKeepingDTO(int wk_id, Timestamp wk_datetime,
			String wk_empemail, String wk_indication, String wk_measure,
			int wk_mpd, int wk_vmd, int wk_hmd, int wk_csd, int wk_itd,
			int wk_wio, int wk_wim, int wk_hwd, int wk_sii,
			String wk_specificity, String wk_report, String wk_delivery,
			String deptName) {
		super();
		this.wk_id = wk_id;
		this.wk_datetime = wk_datetime;
		this.wk_empemail = wk_empemail;
		this.wk_indication = wk_indication;
		this.wk_measure = wk_measure;
		this.wk_mpd = wk_mpd;
		this.wk_vmd = wk_vmd;
		this.wk_hmd = wk_hmd;
		this.wk_csd = wk_csd;
		this.wk_itd = wk_itd;
		this.wk_wio = wk_wio;
		this.wk_wim = wk_wim;
		this.wk_hwd = wk_hwd;
		this.wk_sii = wk_sii;
		this.wk_specificity = wk_specificity;
		this.wk_report = wk_report;
		this.wk_delivery = wk_delivery;
		this.deptName = deptName;
	}

	/**
	 * @param wk_empemail
	 * @param wk_indication
	 * @param wk_measure
	 * @param wk_mpd
	 * @param wk_vmd
	 * @param wk_hmd
	 * @param wk_csd
	 * @param wk_itd
	 * @param wk_wio
	 * @param wk_wim
	 * @param wk_hwd
	 * @param wk_sii
	 * @param wk_specificity
	 * @param wk_report
	 * @param wk_delivery
	 */
	public WatchKeepingDTO(String wk_empemail, String wk_indication,
			String wk_measure, int wk_mpd, int wk_vmd, int wk_hmd, int wk_csd,
			int wk_itd, int wk_wio, int wk_wim, int wk_hwd, int wk_sii,
			String wk_specificity, String wk_report, String wk_delivery) {
		super();
		this.wk_empemail = wk_empemail;
		this.wk_indication = wk_indication;
		this.wk_measure = wk_measure;
		this.wk_mpd = wk_mpd;
		this.wk_vmd = wk_vmd;
		this.wk_hmd = wk_hmd;
		this.wk_csd = wk_csd;
		this.wk_itd = wk_itd;
		this.wk_wio = wk_wio;
		this.wk_wim = wk_wim;
		this.wk_hwd = wk_hwd;
		this.wk_sii = wk_sii;
		this.wk_specificity = wk_specificity;
		this.wk_report = wk_report;
		this.wk_delivery = wk_delivery;
	}

	/**
	 * @param wk_id
	 * @param wk_datetime
	 * @param wk_empemail
	 * @param wk_indication
	 * @param wk_measure
	 * @param wk_mpd
	 * @param wk_vmd
	 * @param wk_hmd
	 * @param wk_csd
	 * @param wk_itd
	 * @param wk_wio
	 * @param wk_wim
	 * @param wk_hwd
	 * @param wk_sii
	 * @param wk_specificity
	 * @param wk_report
	 * @param wk_delivery
	 */
	public WatchKeepingDTO(int wk_id, Timestamp wk_datetime,
			String wk_empemail, String wk_indication, String wk_measure,
			int wk_mpd, int wk_vmd, int wk_hmd, int wk_csd, int wk_itd,
			int wk_wio, int wk_wim, int wk_hwd, int wk_sii,
			String wk_specificity, String wk_report, String wk_delivery) {
		super();
		this.wk_id = wk_id;
		this.wk_datetime = wk_datetime;
		this.wk_empemail = wk_empemail;
		this.wk_indication = wk_indication;
		this.wk_measure = wk_measure;
		this.wk_mpd = wk_mpd;
		this.wk_vmd = wk_vmd;
		this.wk_hmd = wk_hmd;
		this.wk_csd = wk_csd;
		this.wk_itd = wk_itd;
		this.wk_wio = wk_wio;
		this.wk_wim = wk_wim;
		this.wk_hwd = wk_hwd;
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

	public Timestamp getWk_datetime() {
		return wk_datetime;
	}

	public void setWk_datetime(Timestamp wk_datetime) {
		this.wk_datetime = wk_datetime;
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

	public int getWk_vmd() {
		return wk_vmd;
	}

	public void setWk_vmd(int wk_vmd) {
		this.wk_vmd = wk_vmd;
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

	public int getWk_wio() {
		return wk_wio;
	}

	public void setWk_wio(int wk_wio) {
		this.wk_wio = wk_wio;
	}

	public int getWk_wim() {
		return wk_wim;
	}

	public void setWk_wim(int wk_wim) {
		this.wk_wim = wk_wim;
	}

	public int getWk_hwd() {
		return wk_hwd;
	}

	public void setWk_hwd(int wk_hwd) {
		this.wk_hwd = wk_hwd;
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

	
}
