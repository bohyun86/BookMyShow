package com.itwillbs.domain.musical;

import lombok.Data;

import java.io.File;

@Data
public class MusicalDTO {

    // musical 테이블
    private int musicalId;
    private int memberId;
    private String title; // 1
    private String description;
    private String startDate; //
    private String endDate; //
    private int ageLimit; // 1
    private String createdAt; //
    private String updatedAt; //
    private String totalTime; //
    private String intervalTime; //
    private int genreId; // 1
    private File musicalImage; // 1
    private File musicalDescriptionImage; // 1
    private String musicalStaff;
    private String request; // 1

    // Actor 테이블
    private int actorId;
    private String Name; // 1

    //TicketPrice 테이블
    private int ticketPriceId;
    private int[] price; // 1
    private String[] capacity; // 1
    private String[] seatClassId; // 1


    // Performance 테이블
    private int performanceId;
    private String performanceDate; // 1

    // Venue 테이블
    private int venueId;
    private String venueTitle;
    private String publicVenueId; //
    private String postCode; //
    private String basicAddress; // 1
    private String detailAddress; //
    private String region;
    private int totalSeat; //


    private int UserId;
    private boolean reserved; //






}
