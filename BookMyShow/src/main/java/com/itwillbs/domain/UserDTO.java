package com.itwillbs.domain;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

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


    @OneToOne(mappedBy = "userDTO", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private PartnerDTO partnerDTO;


    

    @OneToMany(mappedBy = "userDTO", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<PartnerQnaDTO>partnerQnaDTO;



    @Column(name = "is_encoded")
    private boolean isEncoded;

    @Column(name = "temp_password")
    private String tempPassword;

    @Column(name = "temp_password_created_at")
    @UpdateTimestamp
    private Timestamp tempPasswordCreatedAt;


}


