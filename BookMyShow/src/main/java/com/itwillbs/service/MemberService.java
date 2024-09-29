package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.login.MemberDTO;
import com.itwillbs.repository.MemberRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.UserDTOAdmin;

@Service
@AllArgsConstructor
public class MemberService {

	private MemberDAO memberDAO;
	private MemberRepository memberRepository;
	
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

	public List<UserDTOAdmin> memberpay(int user_id) {
		// TODO Auto-generated method stub
		return memberDAO.memberpay(user_id);
	}
	//결제내역

	public void memberdelete(int member_id) {
		// TODO Auto-generated method stub.
		memberDAO.memberdelete(member_id);
		
	}
	//회원삭제




}
