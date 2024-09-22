package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class VenueDTO {
	private Integer venueId;
	private String venueName;
	private String address;
	private Integer capacity;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private String regionId;
	private String postalCode;
	private String detailAddress;
	private String publicVenueId;
}
