package com.itwillbs.domain.Performance;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

@Data
@Entity(name = "Performance")
public class PerformanceDTO {

    @Id
    @Column(name = "performance_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int performanceId;

    @Column(name = "performance_date")
    private LocalDate performanceDate;

    @Column(name = "created_at", nullable = false, updatable = false)
    @CreationTimestamp // Hibernate가 자동으로 현재 타임스탬프를 할당
    private Timestamp createdAt;

    @Column(name = "updated_at")
    @UpdateTimestamp
    private Timestamp updatedAt;

    @ManyToOne
    @JoinColumn(name = "musical_id")
    private MusicalDTO musicalId;

    @ManyToOne
    @JoinColumn(name = "venue_id")
    private VenueDTO venueId;

    @OneToMany(mappedBy = "performanceId", cascade = CascadeType.ALL)  // 양방향 관계 설정
    private List<TicketPriceDTO> ticketPriceList;


}
