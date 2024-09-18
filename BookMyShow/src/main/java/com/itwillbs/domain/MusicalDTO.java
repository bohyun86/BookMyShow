package com.itwillbs.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MusicalDTO {
	
	 	private int userId;
	    private String title;
	    private String description;
	    private Date start_date;
	    private Date end_date;
	    private int age_limit;
	    
	    private Date created_at;
	    private Date updated_at;
	    private int partner_id;
	    private int genre_id;
	    private int venue_id;
	    private int total_duration;
	    private int interval_duration;
	    private String musical_sponsor;
	    private int approved;
	    private Date discount_start_date;
	    private Date discount_end_date;
	    private double discount_rate;
	    private String request;
	    private int reserved;
	    private int tickets_per_person;
		public String getMusical() {
			// TODO Auto-generated method stub
			return null;
		}

	
	
	
	
}//
