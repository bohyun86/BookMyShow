package com.itwillbs.domain;

import java.sql.Timestamp;

public class SupportNoticeDTO {
	
	private int notice_id;
	private String title;
	private String content;
	private Timestamp created_at;
	private Timestamp update_at;
	
	
	
	@Override
	public String toString() {
		return "SupportNoticeDTO [notice_id=" + notice_id + ", title=" + title + ", content=" + content
				+ ", created_at=" + created_at + ", update_at=" + update_at + "]";
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
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
	public Timestamp getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(Timestamp update_at) {
		this.update_at = update_at;
	}
	
	

}
