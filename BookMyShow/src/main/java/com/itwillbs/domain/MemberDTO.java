package com.itwillbs.domain;

import lombok.Data;

import javax.persistence.Column;

@Data
public class MemberDTO {
    @Column(name = "member_id")
    private int memberId;
    private String address;
    private String birthdate;
    private String gender;
    @Column(name = "created_at")
    private String createdAt;
    @Column(name = "updated_at")
    private String updatedAt;
    @Column(name = "user_id")
    private int userId;
}
