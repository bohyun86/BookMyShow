package com.itwillbs.domain;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDate;

import javax.persistence.Column;

@Data
public class MemberDTO {
    private int memberId;
    private String address;
    private LocalDate birthdate;
    private String gender;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private int userId;
}
