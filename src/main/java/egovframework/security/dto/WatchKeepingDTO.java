package egovframework.security.dto;

import java.sql.Timestamp;

public class WatchKeepingDTO {
	private int wk_id;
	private Timestamp wk_datetime;
	private String wk_empemail;
	private String wk_indication;
	private String wk_measure;
	private int wk_na;
	private int wk_nb;
	private int wk_nc;
	private int wk_nd;
	private int wk_ne;
	private int wk_nf;
	private int wk_ng;
	private int wk_nh;
	private int wk_ni;
	private String wk_specificity;
	private String wk_report;
	private String wk_delivery;

	public WatchKeepingDTO(){
		
	}
	

	/**
	 * @param wk_id
	 * @param wk_datetime
	 * @param wk_empemail
	 * @param wk_indication
	 * @param wk_measure
	 * @param wk_na
	 * @param wk_nb
	 * @param wk_nc
	 * @param wk_nd
	 * @param wk_ne
	 * @param wk_nf
	 * @param wk_ng
	 * @param wk_nh
	 * @param wk_ni
	 * @param wk_specificity
	 * @param wk_report
	 * @param wk_delivery
	 */
	public WatchKeepingDTO(int wk_id, Timestamp wk_datetime,
			String wk_empemail, String wk_indication, String wk_measure,
			int wk_na, int wk_nb, int wk_nc, int wk_nd, int wk_ne, int wk_nf,
			int wk_ng, int wk_nh, int wk_ni, String wk_specificity,
			String wk_report, String wk_delivery) {
		super();
		this.wk_id = wk_id;
		this.wk_datetime = wk_datetime;
		this.wk_empemail = wk_empemail;
		this.wk_indication = wk_indication;
		this.wk_measure = wk_measure;
		this.wk_na = wk_na;
		this.wk_nb = wk_nb;
		this.wk_nc = wk_nc;
		this.wk_nd = wk_nd;
		this.wk_ne = wk_ne;
		this.wk_nf = wk_nf;
		this.wk_ng = wk_ng;
		this.wk_nh = wk_nh;
		this.wk_ni = wk_ni;
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
	 * @param wk_na
	 * @param wk_nb
	 * @param wk_nc
	 * @param wk_nd
	 * @param wk_ne
	 * @param wk_nf
	 * @param wk_ng
	 * @param wk_nh
	 * @param wk_ni
	 * @param wk_specificity
	 * @param wk_report
	 * @param wk_delivery
	 */
	public WatchKeepingDTO(String wk_empemail, String wk_indication, String wk_measure,
			int wk_na, int wk_nb, int wk_nc, int wk_nd, int wk_ne, int wk_nf,
			int wk_ng, int wk_nh, int wk_ni, String wk_specificity,
			String wk_report, String wk_delivery) {
		super();
		this.wk_empemail = wk_empemail;
		this.wk_indication = wk_indication;
		this.wk_measure = wk_measure;
		this.wk_na = wk_na;
		this.wk_nb = wk_nb;
		this.wk_nc = wk_nc;
		this.wk_nd = wk_nd;
		this.wk_ne = wk_ne;
		this.wk_nf = wk_nf;
		this.wk_ng = wk_ng;
		this.wk_nh = wk_nh;
		this.wk_ni = wk_ni;
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

	public int getWk_na() {
		return wk_na;
	}

	public void setWk_na(int wk_na) {
		this.wk_na = wk_na;
	}

	public int getWk_nb() {
		return wk_nb;
	}

	public void setWk_nb(int wk_nb) {
		this.wk_nb = wk_nb;
	}

	public int getWk_nc() {
		return wk_nc;
	}

	public void setWk_nc(int wk_nc) {
		this.wk_nc = wk_nc;
	}

	public int getWk_nd() {
		return wk_nd;
	}

	public void setWk_nd(int wk_nd) {
		this.wk_nd = wk_nd;
	}

	public int getWk_ne() {
		return wk_ne;
	}

	public void setWk_ne(int wk_ne) {
		this.wk_ne = wk_ne;
	}

	public int getWk_nf() {
		return wk_nf;
	}

	public void setWk_nf(int wk_nf) {
		this.wk_nf = wk_nf;
	}

	public int getWk_ng() {
		return wk_ng;
	}

	public void setWk_ng(int wk_ng) {
		this.wk_ng = wk_ng;
	}

	public int getWk_nh() {
		return wk_nh;
	}

	public void setWk_nh(int wk_nh) {
		this.wk_nh = wk_nh;
	}

	public int getWk_ni() {
		return wk_ni;
	}

	public void setWk_ni(int wk_ni) {
		this.wk_ni = wk_ni;
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

	
	
	
}
