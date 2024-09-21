package com.itwillbs.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class PartnerDTO {

	private int partnerId;
	private String companyName;
	private String businessId;
	private String accountNumber;
	private String createdAt;
	private String updatedAt;
	private int userId;
	private int partnerStatus;
	private String bankName;
	private String accountOwner;
	private int approved;
	
	 private List<PartnerQnaDTO>partnerQnaDTO;	 
	
	
	
	
	
	
}//
