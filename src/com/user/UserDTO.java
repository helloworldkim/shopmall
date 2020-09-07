package com.user;

public class UserDTO {
	private String userName; //이름
	private String userId;	//아이디
	private String userPwd;	//비밀번호
	private String userPhone;	//휴대폰
	private String userBirth;	//생년월일
	private String userEmail;	//이메일
	private int userZipcode; //우편번호
	private String userAddress; //주소
	private int admin;	//등급 일반회원0 관리자1
	private String emailAgreement;	//이메일수신동의 y,n
	private String personalInfo;	//개인정보 약관동의 y 
	private String privacy;			//회사정책 동의 y
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getEmailAgreement() {
		return emailAgreement;
	}
	public void setEmailAgreement(String emailAgreement) {
		this.emailAgreement = emailAgreement;
	}
	public String getPersonalInfo() {
		return personalInfo;
	}
	public void setPersonalInfo(String personalInfo) {
		this.personalInfo = personalInfo;
	}
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	public int getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(int userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	
	
	
}
