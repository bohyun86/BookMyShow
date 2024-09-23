package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PerformanceDTO {
	private Integer performanceId;
	private LocalDateTime performanceDate;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private Integer musicalId;
	private Integer venueId;
	
	private String musicalTitle;
}
