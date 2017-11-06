package egovframework.security.dto;

import java.sql.Timestamp;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class OfficeSecurityDTO {
	private int os_id;
	private String os_empemail;
	private int os_deptcode;
	private int os_document;
	private int os_clean;
	private int os_lightout;
	private int os_ventilation;
	private int os_door;
	private String os_etc;
	private Timestamp os_datetime;
	private byte[] imgFile;
	
	public OfficeSecurityDTO(){
		
	}
	
	/**
	
	 * @param os_empemail
	 * @param os_deptcode
	 * @param os_document
	 * @param os_clean
	 * @param os_lightout
	 * @param os_ventilation
	 * @param os_door
	 * @param os_etc
	 */
	public OfficeSecurityDTO(String os_empemail, int os_deptcode,
			int os_document, int os_clean, int os_lightout, int os_ventilation,
			int os_door, String os_etc) {
		super();
		this.os_empemail = os_empemail;
		this.os_deptcode = os_deptcode;
		this.os_document = os_document;
		this.os_clean = os_clean;
		this.os_lightout = os_lightout;
		this.os_ventilation = os_ventilation;
		this.os_door = os_door;
		this.os_etc = os_etc;
	}
	

	/**
	 * @param os_id
	 * @param os_empemail
	 * @param os_deptcode
	 * @param os_document
	 * @param os_clean
	 * @param os_lightout
	 * @param os_ventilation
	 * @param os_door
	 * @param os_etc
	 */
	public OfficeSecurityDTO(int os_id, String os_empemail, int os_deptcode,
			int os_document, int os_clean, int os_lightout, int os_ventilation,
			int os_door, String os_etc) {
		super();
		this.os_id = os_id;
		this.os_empemail = os_empemail;
		this.os_deptcode = os_deptcode;
		this.os_document = os_document;
		this.os_clean = os_clean;
		this.os_lightout = os_lightout;
		this.os_ventilation = os_ventilation;
		this.os_door = os_door;
		this.os_etc = os_etc;
	}
	

	/**
	 * @param os_id
	 * @param os_empemail
	 * @param os_deptcode
	 * @param os_document
	 * @param os_clean
	 * @param os_lightout
	 * @param os_ventilation
	 * @param os_door
	 * @param os_etc
	 * @param os_datetime
	 * @param imgFile
	 */
	public OfficeSecurityDTO(String os_empemail, int os_deptcode,
			int os_document, int os_clean, int os_lightout, int os_ventilation,
			int os_door, String os_etc,
			byte[] imgFile) {
		super();
		this.os_empemail = os_empemail;
		this.os_deptcode = os_deptcode;
		this.os_document = os_document;
		this.os_clean = os_clean;
		this.os_lightout = os_lightout;
		this.os_ventilation = os_ventilation;
		this.os_door = os_door;
		this.os_etc = os_etc;
		this.imgFile = imgFile;
	}


	/**
	 * @param os_id
	 * @param os_empemail
	 * @param os_deptcode
	 * @param os_document
	 * @param os_clean
	 * @param os_lightout
	 * @param os_ventilation
	 * @param os_door
	 * @param os_etc
	 * @param imgFile
	 */
	public OfficeSecurityDTO(int os_id, String os_empemail, int os_deptcode,
			int os_document, int os_clean, int os_lightout, int os_ventilation,
			int os_door, String os_etc, byte[] imgFile) {
		super();
		this.os_id = os_id;
		this.os_empemail = os_empemail;
		this.os_deptcode = os_deptcode;
		this.os_document = os_document;
		this.os_clean = os_clean;
		this.os_lightout = os_lightout;
		this.os_ventilation = os_ventilation;
		this.os_door = os_door;
		this.os_etc = os_etc;
		this.imgFile = imgFile;
	}

	public int getOs_id() {
		return os_id;
	}
	public void setOs_id(int os_id) {
		this.os_id = os_id;
	}
	public String getOs_empemail() {
		return os_empemail;
	}
	public void setOs_empemail(String os_empemail) {
		this.os_empemail = os_empemail;
	}
	public int getOs_deptcode() {
		return os_deptcode;
	}
	public void setOs_deptcode(int os_deptcode) {
		this.os_deptcode = os_deptcode;
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
	public Timestamp getOs_datetime() {
		return os_datetime;
	}
	public void setOs_datetime(Timestamp os_datetime) {
		this.os_datetime = os_datetime;
	}

	public byte[] getImgFile() {
		return imgFile;
	}

	public void setImgFile(byte[] imgFile) {
		this.imgFile = imgFile;
	}
	
	
	
}
