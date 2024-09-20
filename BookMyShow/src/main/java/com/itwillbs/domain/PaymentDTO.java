package com.itwillbs.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PaymentDTO {
	private Integer paymentId;
    private LocalDateTime paymentDate;
    private String paymentMethod;
    private Integer paymentAmount;
    private String status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Integer bookingId;
    private String refundType;
    private BigDecimal refundAmount;
    private Integer usedPoints;
}
