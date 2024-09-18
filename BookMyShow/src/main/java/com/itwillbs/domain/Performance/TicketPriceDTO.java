package com.itwillbs.domain.Performance;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Data
@Entity(name = "TicketPrice")
public class TicketPriceDTO {

    @Id
    @Column(name = "ticket_price_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ticketPriceId;

    @Column(name = "price")
    private int price;

    private int capacity;

    @Column(name = "tickets_sold")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ticketsSold;
    private long revenue;
    private long fee;
    @Column(name = "settlement_amo")
    private long settlementAmo;
    @Column(name = "settlement_date")
    private Date settlementDate;
    @Column(name = "created_at", nullable = false, updatable = false)
    @CreationTimestamp // Hibernate가 자동으로 현재 타임스탬프를 할당
    private Timestamp createdAt;
    @Column(name = "updated_at")
    @UpdateTimestamp
    private Timestamp updatedAt;

    @ManyToOne
    @JoinColumn(name = "performance_Id")
    private PerformanceDTO performanceId;

    @Column(name = "seat_class_id")
    private int seatClassId;
}
