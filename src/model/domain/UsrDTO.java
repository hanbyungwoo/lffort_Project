package model.domain;

public class UsrDTO {
	String usrId;
	String usrPw;
	String usrName;
	String photo;
	String usrGrade;
	String usrEmail;
	String userPhone;
	
	public UsrDTO() { }
	
	public UsrDTO(String usrId, String usrPw, String usrName,
							String photo, String usrGrade, String usrEmail,
							String userPhone) {
		this.usrId = usrId;
		this.usrPw = usrPw;
		this.usrName = usrName;
		this.photo = photo;
		this.usrGrade = usrGrade;
		this.usrEmail = usrEmail;
		this.userPhone = userPhone;
	}

	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public String getUsrPw() {
		return usrPw;
	}
	public void setUsrPw(String usrPw) {
		this.usrPw = usrPw;
	}
	public String getUsrName() {
		return usrName;
	}
	public void setUsrName(String usrName) {
		this.usrName = usrName;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUsrGrade() {
		return usrGrade;
	}
	public void setUsrGrade(String usrGrade) {
		this.usrGrade = usrGrade;
	}
	public String getUsrEmail() {
		return usrEmail;
	}
	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	
}
