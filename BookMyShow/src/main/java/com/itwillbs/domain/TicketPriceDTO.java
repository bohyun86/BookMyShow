package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TicketPriceDTO {
	private Integer ticketPriceId;
	private Integer price;
	private Integer capacity;
	private Integer ticketsSold;
	private Long revenue;
	private Long fee;
	private Long settlementAmount;
	private LocalDateTime settlementDate;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private Integer performanceId;
	private Integer seatClassId;
}
