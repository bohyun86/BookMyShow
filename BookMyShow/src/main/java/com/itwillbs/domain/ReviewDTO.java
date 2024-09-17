package com.itwillbs.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReviewDTO {
	private Integer reviewId;
    private BigDecimal rating;
    private String content;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String comment;
    private Integer memberId;
    private Integer musicalId;
}
