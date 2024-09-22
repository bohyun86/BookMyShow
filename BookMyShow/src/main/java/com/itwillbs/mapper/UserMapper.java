package com.itwillbs.mapper;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;

public interface UserMapper {

    int insertUser(UserDTO userDTO);

    int insertMember(MemberDTO memberDTO);

    UserDTO loginPro(UserDTO userDTO);

    UserDTO getUser(UserDTO userDTO);

    UserDTO getUserByEmail(UserDTO userDTO);

    UserDTO getUserById(UserDTO userDTO);

    int updateUserPasswordAndEncode(UserDTO userDTO);

	int updateUser(UserDTO userDTO);

	int deleteUser(int userId);

    UserDTO findIdPro(UserDTO userDTO);

    UserDTO findPwPro(UserDTO userDTO);

    int updateUserTempPw(UserDTO userDTO);

}
