package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CouponDTO {
	private Integer couponId;
	private String code;
	private Integer couponAmount;
	private String status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
}
