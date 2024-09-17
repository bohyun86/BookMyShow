package com.itwillbs.domain.Performance;

import com.itwillbs.domain.PartnerDTO;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class PerformanceRegistrationDTO {

    // musical 테이블
    private int musicalId; // 1
    private int partnerId; // 1
    private String title; // 1
    private String description; // 1
    private Date startDate; // 1
    private Date endDate; // 1
    private int ageLimit; // 1
    private Timestamp createdAt; // 1
    private Timestamp updatedAt; // 1
    private String totalTime; // x
    private String intervalTime; // x
    private int genreId; // 1
    private int ticketsPerPerson; // x
    private Date discountStartDate; // x
    private Date discountEndDate; // x
    private String discountRate; // x
    private String musicalSponsor; // x
    private String request; // x
    private boolean reserved; //

    // AttachFile 테이블
    private MultipartFile musicalPost; // 테이블로 관리
    private MultipartFile[] musicalImages; // 테이블로 관리

    // Actor 테이블
    private int actorId;
    private String[] actorList; // 1

    //TicketPrice 테이블
    private int ticketPriceId;
    private int[] classes; // 1
    private int[] price; // 1
    private int[] numberOfSeats; // 1


    // Performance 테이블
    private int performanceId;
    private String performanceDate; // 1

    // Venue 테이블
    private String venueId;//
    private String venueTitle; //
    private String publicVenueId; //
    private String postCode; //
    private String basicAddress; //
    private String detailAddress; //
    private String regionName;//
    private int totalSeat; //

}
