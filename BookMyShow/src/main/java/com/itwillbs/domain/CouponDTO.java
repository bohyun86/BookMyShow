package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CouponDTO {
    private int couponId;
    private String code;
    private int couponAmount;
    private String status;
    private Timestamp createdAt;
    private Timestamp updatedAt;

}
