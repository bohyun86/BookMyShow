package com.itwillbs.domain;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

import lombok.Data;

@Data
@Entity
@Table(name="Inquiry")
public class PartnerQnaDTO {

    @Column(name = "user_id")
	private int userId;
	
    @Id
	@Column(name = "inquiry_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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
	
//	 @Column(name = "user_id", insert="false" update="false")
//	    private int userId;
	
	
	 @ManyToOne
	 @JoinColumn(name = "user_id", insertable = false, updatable = false) // user_id에 대한 참조
	 private PartnerDTO partnerDTO;
	 
	
	
}
