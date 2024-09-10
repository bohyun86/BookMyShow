package com.itwillbs.domain;

import lombok.Data;


@Data
public class UserDTO {

    private int userId;
    private String userName;
    private String password;
    private String email;
    private String phoneNumber;
    private String name;
    private String userRole;
    private String createdAt;
    private String updatedAt;


}


