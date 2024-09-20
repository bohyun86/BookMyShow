package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PointDTO {
    private Integer actorId;
    private String type;
    private Integer balance;
    private LocalDateTime timestamp;
    private Integer userId;
}