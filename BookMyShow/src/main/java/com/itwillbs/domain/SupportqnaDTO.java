package com.itwillbs.domain;

import java.sql.Timestamp;

public class SupportqnaDTO {
	
	private int faq_id;
	private String question;
	private String answer;
	private Timestamp created_at;
	private Timestamp update_at;
	
	@Override
	public String toString() {
		return "SupportqnaDTO [faq_id=" + faq_id + ", question=" + question + ", answer=" + answer + ", created_at="
				+ created_at + ", update_at=" + update_at + "]";
	}
	
	public int getFaq_id() {	
		
		return faq_id;
	}
	
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
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
