package com.itwillbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public UserDTO getMember(String id) {
		System.out.println("MemberService getMember");
		return memberDAO.getMember(id);
	}

}
