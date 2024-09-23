


package com.itwillbs.domain;


import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;


import lombok.Data;


@Data
public class MusicalDTO {
	private Integer musicalId;
    private String title;
    private String description;
    private LocalDate startDate;
    private LocalDate endDate;
    private Integer ageLimit;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Integer partnerId;
    private Integer genreId;
    private Integer venueId;
    private Integer totalDuration;
    private Integer intervalDuration;
    private String musicalSponsor;
    private Boolean approved;
    private LocalDate discountStartDate;
    private LocalDate discountEndDate;
    private BigDecimal discountRate;
    private String request;
    private Boolean reserved;
    private Integer ticketsPerPerson;
}

