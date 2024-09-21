package com.itwillbs.domain;

import java.util.List;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Entity(name = "User")
public class UserDTO {

    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;

    @Column(name = "user_name")
    private String userName;

    private String password;
    private String email;

    @Column(name = "phone_number")
    private String phoneNumber;
    private String name;

    @Column(name = "user_role")
    private String userRole;

    @Column(name = "created_at")
    @CreationTimestamp
    private Timestamp createdAt;

    @Column(name = "updated_at")
    @UpdateTimestamp
    private Timestamp updatedAt;

    @OneToOne
    private PartnerDTO partnerDTO;
    
    @OneToMany(mappedBy = "partnerDTO")
	 private List<PartnerQnaDTO>partnerQnaDTO;
}


