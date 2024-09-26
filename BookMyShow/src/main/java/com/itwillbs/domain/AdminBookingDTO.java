package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminBookingDTO {
	
	
	private int booking_id;
	private Timestamp booking_date;
	private String status;
	private String created_at;
	private String updated_at;
	private int musical_id;
	private int member_id;
	private int ticket_count;
	private int performance_id;

	

	
	
	

	
	
//	//booking
//	private int booked_seat_id;
//	private String seat_number;
//	private int seat_class_id;
	
	
//	
	
	
	
	
	
	
	
	

}
