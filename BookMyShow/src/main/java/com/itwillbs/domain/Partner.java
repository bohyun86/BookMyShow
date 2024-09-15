package com.itwillbs.domain;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Partner {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "partner_id")
    private int partnerId;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "business_id")
    private String businessId;

    @Column(name = "account_number")
    private String accountNumber;

    @Column(name = "created_at")
    private String createdAt;

    @Column(name = "updated_at")
    private String updatedAt;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "partner_status")
    private boolean partnerStatus; // true 활동중, false 탈퇴

    @Column(name = "bank_name")
    private String bankName;

    @Column(name = "account_owner")
    private String accountOwner;

}
