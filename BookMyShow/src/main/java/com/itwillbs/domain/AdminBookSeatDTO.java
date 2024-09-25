package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminBookSeatDTO {

	private int booked_seat_id;
	private String seat_number;
	private Timestamp  created_at;
	private Timestamp updated_at;
	private int seat_class_id;
	private int booking_id; 
	
	
	
	
	
	
	
}
