package com.itwillbs.domain.Performance;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class PerformanceRegistrationDTO {

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
    private MultipartFile musicalPost; // 1
    private MultipartFile[] musicalImages; // 1
    private String musicalStaff;
    private String request; // 1
    private int perTicket;
    private int totalTicket;
    private String discountStartDate;
    private String discountEndDate;
    private String discountRate;

    // Actor 테이블
    private int actorId;
    private String[] actorList; // 1

    //TicketPrice 테이블
    private int ticketPriceId;
    private int[] price; // 1
    private String[] classes; // 1
    private String[] numberOfSeats; // 1
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
    private String regionName;
    private int totalSeat; //

    private boolean reserved; //






}
