package com.itwillbs.service;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Log4j2
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

	@Transactional
	@Override
	public Boolean updateUser(UserDTO userDTO, String newPassword) {
		if (userDTO == null) {
			log.warn("유효하지 않은 사용자 정보");
			return false;
		}
		if (newPassword != null && !newPassword.trim().isEmpty()) {
			if (!isValidPassword(newPassword)) {
				log.warn("유효하지 않은 새 비밀번호: {}", userDTO.getUserId());
				return false;
			}
			userDTO.setPassword(newPassword);
		}
		if (!isValidEmail(userDTO.getEmail()) || !isValidPhoneNumber(userDTO.getPhoneNumber())) {
			log.warn("유효하지 않은 이메일 또는 전화번호: {}", userDTO.getUserId());
			return false;
		}
		return userMapper.updateUser(userDTO) > 0;
	}

	private boolean isValidPassword(String password) {
		return password.matches("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,20}$");
	}

	private boolean isValidEmail(String email) {
		return email.matches("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$");
	}

	private boolean isValidPhoneNumber(String phoneNumber) {
		return phoneNumber.matches("^010\\d{4}\\d{4}$");
	}

}
