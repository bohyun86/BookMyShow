package com.itwillbs.domain;

import java.sql.Timestamp;

public class SupportinquiryDTO {
	
	private int inquiry_id;
	private String inquiry_type;
	private String title;
	private String content;
	private Timestamp created_at;
	private Timestamp updated_at;
	private int answered;
	private String answer_content;
	private int user_id;
	
	@Override
	public String toString() {
		return "SupportinquiryDTO [inquiry_id=" + inquiry_id + ", inquiry_type=" + inquiry_type + ", title=" + title
				+ ", content=" + content + ", created_at=" + created_at + ", updated_at="
				+ updated_at + ", answered=" + answered + ", answer_content=" + answer_content 
				+ ", user_id=" + user_id + "]";
	}
			
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public int getAnswered() {
		return answered;
	}

	public void setAnswered(int answered) {
		this.answered = answered;
	}

	public int getuserId() {
		return inquiry_id;
	}
	public void setuserId(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}

	public int getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public String getInquiry_type() {
		return inquiry_type;
	}
	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}
	
	

}
