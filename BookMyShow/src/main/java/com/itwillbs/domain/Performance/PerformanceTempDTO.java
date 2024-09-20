package com.itwillbs.domain.Performance;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;


@Data
@Entity(name = "PerformanceTemp")
public class PerformanceTempDTO {

    // musical 테이블
    @Id
    @Column(name = "musical_id")
    private int musicalId; // 1

    @Column(name = "partner_id")
    private int partnerId; // 1

    @Column(name = "title")
    private String title; // 1

    @Column(name = "description")
    private String description; // 1

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "start_date")
    private LocalDate startDate; // 1

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "end_date")
    private LocalDate endDate; // 1

    @Column(name = "age_limit")
    private int ageLimit; // 1

    @Column(name = "created_at", nullable = false, updatable = false)
    @CreationTimestamp
    private Timestamp createdAt; // 1

    @Column(name = "updated_at")
    @UpdateTimestamp
    private Timestamp updatedAt; // 1

    @Column(name = "total_time")
    private String totalTime; // x

    @Column(name = "interval_time")
    private String intervalTime; // x

    @Column(name = "genre_id")
    private int genreId; // 1

    @Column(name = "tickets_per_person")
    private int ticketsPerPerson; // x

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "discount_start_date")
    private LocalDate discountStartDate; // x

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "discount_end_date")
    private LocalDate discountEndDate; // x


    @Column(name = "discount_rate")
    private String discountRate; // x

    @Column(name = "musical_sponsor")
    private String musicalSponsor; // x

    @Column(name = "request")
    private String request; // x

    @Column(name = "reserved")
    private boolean reserved; //

    // AttachFile 테이블
    @Transient
    private MultipartFile musicalPost; // 테이블로 관리

    @Transient
    private MultipartFile[] musicalImages; // 테이블로 관리

    // Actor 테이블

    @Column(name = "actor_list")
    private String actorList; // 1

    @Column(name = "ticket_classes")
    private String classes; // 1

    @Column(name = "ticket_prices")
    private String price; // 1

    @Column(name = "ticket_seats")
    private String numberOfSeats; // 1

    // Performance 테이블

    @Column(name = "performance_date")
    private String performanceDate; // 1

    @Column(name = "venue_title")
    private String venueTitle; //

    @Column(name = "public_venue_id")
    private String publicVenueId; //

    @Column(name = "post_code")
    private String postCode; //

    @Column(name = "basic_address")
    private String basicAddress; //

    @Column(name = "detail_address")
    private String detailAddress; //

    @Column(name = "region_name")
    private String regionName; //

    @Column(name = "total_seat")
    private int totalSeat; //

}
