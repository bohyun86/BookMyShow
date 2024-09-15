package com.itwillbs.service;

import com.itwillbs.domain.UserDTO;

public interface UserService {

    Boolean insertUser(UserDTO userDTO);

    UserDTO loginPro(UserDTO userDTO);

    UserDTO getUser(UserDTO userDTO);

    UserDTO checkId(UserDTO userDTO);

    UserDTO checkEmail(UserDTO userDTO);

    Boolean updateUser(UserDTO userDTO);
    
}
