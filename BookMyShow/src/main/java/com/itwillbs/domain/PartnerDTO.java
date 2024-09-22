package com.itwillbs.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="Partner")
public class PartnerDTO {
	
	@Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	@Column(name = "partner_id")
	private int partnerId;
	
	@Column(name = "company_name")
	private String companyName;
	
	@Column(name = "business_id")
	private String businessId;
	
	 @Column(name = "account_number")
	private String accountNumber;
	 
	 @Column(name = "created_at") 
	private String createdAt;
	 
	 @Column(name = "updated_at") 
	private String updatedAt;
	 
	 @Column(name = "partner_status") 
	private int partnerStatus;
	
	@Column(name = "bank_name")
	private String bankName;
	
	@Column(name = "account_owner")
	private String accountOwner;
	
	 @Column(name = "approved")
	private int approved;
	
	 @OneToMany
	 @JoinColumn(name = "userId")
	 private List<PartnerQnaDTO>partnerQnaDTO;	 
	
	 @OneToOne
	 @JoinColumn(name = "userId")
	 private UserDTO userDTO;
	
	
	
	
}//
