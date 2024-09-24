package com.itwillbs.domain;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="Inquiry")
public class PartnerQnaDTO {

	@Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	@Column(name = "inquiry_id")
	private int inquiryId;
	
	@Column(name = "inquiry_type")
	private String inquiryType;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "created_at")
	private String createdAt;
	
	@Column(name = "updated_at")
	private String updatedAt;
	
	@Column(name = "answered")
	private int answered;
	
	
	
	
	
}
