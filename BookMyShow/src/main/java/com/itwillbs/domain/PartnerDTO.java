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

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import org.hibernate.annotations.CascadeType;

@Data
@Entity
@Table(name="Partner")
public class PartnerDTO {
	
    @Column(name = "user_id")
	private int userId;
	
    @Id
	@Column(name = "partner_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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
	
	 @OneToOne
	 @JoinColumn(name = "userId")
	 @JsonBackReference
	 private UserDTO userDTO;
	
	
	
	
}//
