package com.itwillbs.domain.Performance;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class PerformanceRegistrationDTO {

    // musical 테이블
    private int musicalId; // 1
    private int partnerId; // 1
    private String title; // 1
    private String description; // 1
    private String startDate; // 1
    private String endDate; // 1
    private int ageLimit; // 1
    private String createdAt; // 1
    private String updatedAt; // 1
    private String totalTime; // x
    private String intervalTime; // x
    private int genreId; // 1
    private int perTicket; // x
    private int totalTicket; // x 없어도 될듯
    private String discountStartDate; // x
    private String discountEndDate; // x
    private String discountRate; // x
    private String musicalSponsor; // x
    private String request; // x

    // AttachFile 테이블
    private MultipartFile musicalPost; // 테이블로 관리
    private MultipartFile[] musicalImages; // 테이블로 관리

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
