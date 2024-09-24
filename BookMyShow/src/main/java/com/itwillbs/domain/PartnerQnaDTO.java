package com.itwillbs.domain;


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

import lombok.Data;

@Data
public class PartnerQnaDTO {

	private int user_id;
	
	private int inquiry_id;
	
	private String inquiry_type;
	
	private String title;
	
	private String content;
	
	private String created_at;
	
	private String updated_at;
	
	private int answered;
	
	private String answer_content;
	
	
	
	
	//파트너
	private int partner_id;
	
	private String company_name;
	
	private String business_id;
	
	private String account_number;
	 
	private int partner_status;
	
	private String bank_name;
	
	private String account_owner;
	
	private int approved;
	
	
	//유저
	


    private String user_name;

    private String password;
    private String email;

    private String phone_number;
    private String name;

    private String user_role;

    private boolean isEncoded;

    private String tempPassword;

    private Timestamp tempPasswordCreatedAt;

	@Override
	public String toString() {
		return "PartnerQnaDTO [user_id=" + user_id + ", inquiry_id=" + inquiry_id + ", inquiry_type=" + inquiry_type
				+ ", title=" + title + ", content=" + content + ", created_at=" + created_at + ", updated_at="
				+ updated_at + ", answered=" + answered + ", answer_content=" + answer_content + ", partner_id="
				+ partner_id + ", company_name=" + company_name + ", business_id=" + business_id + ", account_number="
				+ account_number + ", partner_status=" + partner_status + ", bank_name=" + bank_name
				+ ", account_owner=" + account_owner + ", approved=" + approved + ", user_name=" + user_name
				+ ", password=" + password + ", email=" + email + ", phone_number=" + phone_number + ", name=" + name
				+ ", user_role=" + user_role + ", isEncoded=" + isEncoded + ", tempPassword=" + tempPassword
				+ ", tempPasswordCreatedAt=" + tempPasswordCreatedAt + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

	
    
    
    
    
	
	


	
	
}
