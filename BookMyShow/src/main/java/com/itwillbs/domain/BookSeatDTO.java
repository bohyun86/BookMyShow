package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BookSeatDTO {
	private Integer bookedSeatId;
    private String seatNumber;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Integer seatClassId;
    private Integer bookingId;
}
