package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BookingDTO {
	private Integer bookingId;
    private LocalDateTime bookingDate;
    private String status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Integer musicalId;
    private Integer memberId;
    private Integer ticketCount;
    private Integer performanceId;
}
