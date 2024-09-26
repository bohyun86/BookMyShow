package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.UserDTOAdmin;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public UserDTOAdmin getMember(String id, String email, String phoneNumber, String name, String password, String createdAt,String user_role) {
		System.out.println("MemberService getMember");
		System.out.println("MemberService getMember id::"+id);
		System.out.println("MemberService getMember email::"+email);
		System.out.println("MemberService getMember phone_number::"+phoneNumber);
		System.out.println("MemberService getMember name::"+name);
		System.out.println("MemberService getMember password::"+password);
		System.out.println("MemberService getMember createdAt::"+createdAt);
		System.out.println("MemberService getMember user_role::"+user_role);
		return memberDAO.getMember(id,email,phoneNumber,name,password,createdAt,user_role);
	}

	public UserDTOAdmin getMember(String id) {
		return memberDAO.getMember(id);
	}

	public List<UserDTOAdmin> memberBooked(int user_id) {
		// TODO Auto-generated method stub
		return memberDAO.memberBooked(user_id);
	}
	//예매내역



}
