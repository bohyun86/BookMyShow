package com.itwillbs.domain.partner;

import com.itwillbs.domain.Performance.MusicalDTO;
import lombok.Data;
import org.apache.ibatis.annotations.Many;

import javax.persistence.*;
import java.util.List;

@Data
@Entity(name = "Partner")
public class PartnerDTO {

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

    @OneToMany(mappedBy = "partnerId", cascade = CascadeType.ALL)
    private List<MusicalDTO> musical;  // 다대일 양방향 관계 설정

}
