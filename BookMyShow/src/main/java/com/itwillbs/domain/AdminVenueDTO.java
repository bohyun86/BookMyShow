package com.itwillbs.domain;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AdminVenueDTO {
	
	
	
	private int venue_id;
	private String venue_name;
	private int address;
	private Integer capacity;
	private Timestamp created_at;
	private Timestamp updated_at;
	private String region_id;
	private String postal_code;
	private String detail_address;
	private String public_venue_id;

}
