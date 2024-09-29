package com.itwillbs.domain.login;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.itwillbs.domain.UserDTO;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;

@Data
@Entity(name = "Member")
public class MemberDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_id")
    private int memberId;

    private String address;

    private LocalDate birthdate;

    private String gender;

    @Column(name = "created_at")
    @CreationTimestamp
    private Timestamp createdAt;

    @Column(name = "updated_at")
    @UpdateTimestamp
    private Timestamp updatedAt;

    @OneToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private UserDTO userDTO;

}
