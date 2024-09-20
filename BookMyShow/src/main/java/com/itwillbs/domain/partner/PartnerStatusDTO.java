package com.itwillbs.domain.partner;

import lombok.Data;

import java.sql.Timestamp;
import java.time.LocalDate;

@Data
public class PartnerStatusDTO {

    private int musicalId;
    private int musicalNumber;
    private String musicalName;
    private LocalDate startDate;
    private LocalDate endDate;
    private String createdAt;
    private boolean approvalStatus;
    private String partnerId;
    private String partnerName;
    private String phoneNumber;


}
