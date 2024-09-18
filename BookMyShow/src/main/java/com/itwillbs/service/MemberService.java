package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public UserDTO getMember(String id, String email, String phoneNumber, String name, String password, String createdAt) {
		System.out.println("MemberService getMember");
		System.out.println("MemberService getMember id::"+id);
		System.out.println("MemberService getMember email::"+email);
		System.out.println("MemberService getMember phone_number::"+phoneNumber);
		System.out.println("MemberService getMember phone_number::"+name);
		System.out.println("MemberService getMember phone_number::"+password);
		System.out.println("MemberService getMember phone_number::"+createdAt);
		return memberDAO.getMember(id,email,phoneNumber,name,password,createdAt);
	}

}
