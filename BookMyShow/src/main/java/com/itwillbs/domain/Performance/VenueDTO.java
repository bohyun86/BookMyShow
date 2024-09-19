package com.itwillbs.domain.Performance;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Entity(name = "Venue")
public class VenueDTO {

    @Id
    @Column(name = "venue_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int venueId;

    @Column(name = "venue_name")
    private String venueName;

    @Column(name = "postal_code")
    private String postalCode;

    @Column(name = "address")
    private String address;

    @Column(name = "detail_address")
    private String detailAddress;

    @Column(name = "capacity")
    private int totalSeat;

    @Column(name = "created_at", nullable = false, updatable = false)
    @CreationTimestamp // Hibernate가 자동으로 현재 타임스탬프를 할당
    private Timestamp createdAt;

    @Column(name = "updated_at")
    @UpdateTimestamp
    private Timestamp updatedAt;

    @Column(name = "public_venue_id")
    private String publicVenueId;

    @ManyToOne
    @JoinColumn(name = "region_id") // 외래 키로 region_id를 참조
    private RegionDTO regionId; // Region 엔티티와 1:1 관계

}
