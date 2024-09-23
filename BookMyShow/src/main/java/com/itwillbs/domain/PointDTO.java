package com.itwillbs.domain;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class PointDTO {
    private Integer pointId;
    private Integer userId;
    private Integer originalAmount;
    private Integer currentAmount;
    private String type;
    private LocalDateTime createdAt;
    private Integer relatedId;
}