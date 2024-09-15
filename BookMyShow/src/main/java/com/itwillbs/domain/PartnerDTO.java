package com.itwillbs.domain;

import lombok.Data;

@Data
public class PartnerDTO {

    private int partnerId;
    private String companyName;
    private String businessId;
    private String accountNumber;
    private String createdAt;
    private String updatedAt;
    private int userId;
    private boolean partnerStatus; // true 활동중, false 탈퇴
    private String bankName;
    private String accountOwner;

}
