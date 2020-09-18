package com.dto;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("NoticeDTO")				//NotSerializableException때문에 추가함
public class NoticeDTO implements Serializable{
	private int bbsId;			 //글번호
	private String bbsTitle; 	//제목
	private String bbsContent; 	//내용
	private String bbsDate; 	//작성일
	private String bbsAdminId;	//공지 관리자 작성아이디
	private int bbsHit; 		//조회수
	private int bbsAvailable; 	//삭제여부 삭제됨0 , 삭제안됨1
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsAdminId() {
		return bbsAdminId;
	}
	public void setBbsAdminId(String bbsAdminId) {
		this.bbsAdminId = bbsAdminId;
	}
	public int getBbsHit() {
		return bbsHit;
	}
	public void setBbsHit(int bbsHit) {
		this.bbsHit = bbsHit;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}

	
}
