package com.user;

public class UserDTO {
	private String userName; //이름
	private String userId;	//아이디
	private String userPwd;	//비밀번호
	private String userPhone;	//휴대폰
	private String userBirth;	//생년월일
	private String userEmail;	//이메일
	private int admin;	//등급 일반회원0 관리자1
	private String userEmailAgreement;	//이메일수신동의
	private String userPersonalInfo;	//개인정보 약관동의
	private String userPrivacy;			//회사정책 동의
	
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
	public String getUserEmailAgreeMent() {
		return userEmailAgreement;
	}
	public void setUserEmailAgreeMent(String userEmailAgreeMent) {
		this.userEmailAgreement = userEmailAgreeMent;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getUserEmailAgreement() {
		return userEmailAgreement;
	}
	public void setUserEmailAgreement(String userEmailAgreement) {
		this.userEmailAgreement = userEmailAgreement;
	}
	public String getUserPersonalInfo() {
		return userPersonalInfo;
	}
	public void setUserPersonalInfo(String userPersonalInfo) {
		this.userPersonalInfo = userPersonalInfo;
	}
	public String getUserPrivacy() {
		return userPrivacy;
	}
	public void setUserPrivacy(String userPrivacy) {
		this.userPrivacy = userPrivacy;
	}
	
	
	
}
