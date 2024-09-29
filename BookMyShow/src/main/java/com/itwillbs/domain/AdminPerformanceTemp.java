package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminPerformanceTemp {
	
	private int musical_id;
	private int partner_id;
	private String title;
	private String description;
	private Timestamp start_date;
	private Timestamp end_date;
	private int age_limit;
	private Timestamp created_at;
	private Timestamp updated_at;
	private String total_time;
	private Timestamp interval_time;
	private int genre_id;
	private int tickets_per_person;
	private String venue_title;
	
	
	
	
	

}
