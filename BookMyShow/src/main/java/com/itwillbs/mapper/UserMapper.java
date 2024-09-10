package com.itwillbs.mapper;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;

public interface UserMapper {

    int insertUser(UserDTO userDTO);

    int insertMember(MemberDTO memberDTO);

    UserDTO loginPro(UserDTO userDTO);

    UserDTO getUser(UserDTO userDTO);

    UserDTO getUserByEmail(UserDTO userDTO);

}
