package com.itwillbs.service;

import com.itwillbs.domain.UserDTO;

import javax.servlet.http.HttpSession;

public interface UserService {

    Boolean insertUser(UserDTO userDTO);

    UserDTO loginPro(UserDTO userDTO);

    UserDTO getUser(UserDTO userDTO);

    UserDTO checkId(UserDTO userDTO);

    UserDTO checkEmail(UserDTO userDTO);
    
    Boolean updateUser(UserDTO userDTO, String newPassword );

	void deleteUser(UserDTO userDTO);

    boolean updateUserPasswordAndEncode(UserDTO userDTO, String newPassword);

    UserDTO findIdPro(UserDTO userDTO);

    UserDTO findPwPro(UserDTO userDTO);

    boolean updateUserTempPw(UserDTO userDTO);
}
