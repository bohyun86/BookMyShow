package com.itwillbs.service;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.mapper.UserMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    @Transactional
    @Override
    public Boolean insertUser(UserDTO userDTO) {

        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setUserId(userDTO.getUserId());
        userMapper.insertUser(userDTO);
        memberDTO.setUserId(userDTO.getUserId());
        userMapper.insertMember(memberDTO);
        return true;
    }

    @Override
    public UserDTO loginPro(UserDTO userDTO) {
        return userMapper.loginPro(userDTO);
    }

    @Override
    public UserDTO getUser(UserDTO userDTO) {
        return userMapper.getUser(userDTO);
    }

    @Override
    public UserDTO checkId(UserDTO userDTO) {
        return userMapper.getUser(userDTO);
    }

    @Override
    public UserDTO checkEmail(UserDTO userDTO) {
        return userMapper.getUserByEmail(userDTO);
    }
}
