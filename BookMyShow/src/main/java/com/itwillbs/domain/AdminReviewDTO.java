package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminReviewDTO {
	
	private int review_id;
	private double rating;
	private String content;
	private Timestamp created_at;
	private Timestamp updated_at;
	private int member_id;
	private int musical_id;
	private int performance_id;
	
	
	
	
	

}
