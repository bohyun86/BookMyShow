package com.itwillbs.domain.Performance;

import com.itwillbs.domain.partner.PartnerDTO;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

@Data
@Entity(name = "Musical")
public class MusicalDTO {

    @Id
    @Column(name = "musical_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int musicalId; // 1

    @ManyToOne
    @JoinColumn(name = "partner_id")
    private PartnerDTO partnerId;// Partner 엔티티와의 관계 설정


    @Column(name = "approved", columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean approved; // 1
    private String title; // 1
    private String description; // 1
    @Column(name = "start_date")
    private LocalDate startDate; // 1
    @Column(name = "end_date")
    private LocalDate endDate; // 1
    @Column(name = "age_limit")
    private int ageLimit; // 1
    @Column(name = "created_at", nullable = false, updatable = false)
    @CreationTimestamp // Hibernate가 자동으로 현재 타임스탬프를 할당
    private Timestamp createdAt; // 1

    @Column(name = "updated_at")
    @UpdateTimestamp
    private Timestamp updatedAt; // 1
    @Column(name = "total_duration")
    private String totalTime; // x
    @Column(name = "interval_duration")
    private String intervalTime; // x

    @ManyToOne
    @JoinColumn(name = "genre_id")
    private GenreDTO genreId; // 1

    @ManyToOne
    @JoinColumn(name = "venue_id")
    private VenueDTO venueId; // 1

    @Column(name = "tickets_per_person")
    private int ticketsPerPerson; // x
    @Column(name = "discount_start_date")
    private LocalDate discountStartDate; // x
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


    @OneToMany(mappedBy = "musicalId", cascade = CascadeType.ALL)  // 양방향 관계 설정
    private List<PerformanceDTO> performances;  // 일대다 관계

}
