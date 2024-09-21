package com.itwillbs.domain;

import lombok.Data;

@Data
public class PartnerQnaDTO {

	private int inquiryId;
	private String inquiryType;
	private String title;
	private String content;
	private String createdAt;
	private String updatedAt;
	private int userId;
	private int answered;
	
}
