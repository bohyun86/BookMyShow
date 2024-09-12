package com.itwillbs.domain.musical;

import lombok.Data;

import java.sql.Date;

/*
* musical_id
title
description
start_date
end_date
age_limit
created_at
updated_at
partner_id
genre_id
venue_id
musical_image

* */

@Data
public class MusicalDTO {

    // musical 테이블
    private int musicalId;
    private String title; // 1
    private String description;
    private String startDate; //
    private String endDate; //
    private int ageLimit; // 1
    private String createdAt; //
    private String updatedAt; //
    private int genreId; // 1
    // private int venueId; // 1
    private String musicalImage;

    private String totalTime; //
    private String intervalTime; //

    private String venueTitle; //
    private String postCode; //
    private String basicAddress; // 1
    private String detailAddress; //


    private int UserId;
    private boolean reserved; //

    private int venueId;
    private int totalSeat; //



}
