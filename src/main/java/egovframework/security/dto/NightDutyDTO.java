package egovframework.security.dto;

import java.sql.Timestamp;

public class NightDutyDTO {
	private Timestamp nd_date;
	private String nd_empemail;
	/**
	 * @param nd_date
	 * @param nd_empemail
	 */
	public NightDutyDTO(Timestamp nd_date, String nd_empemail) {
		super();
		this.nd_date = nd_date;
		this.nd_empemail = nd_empemail;
	}
	public Timestamp getNd_date() {
		return nd_date;
	}
	public void setNd_date(Timestamp nd_date) {
		this.nd_date = nd_date;
	}
	public String getNd_empemail() {
		return nd_empemail;
	}
	public void setNd_empemail(String nd_empemail) {
		this.nd_empemail = nd_empemail;
	}
	
	
}
