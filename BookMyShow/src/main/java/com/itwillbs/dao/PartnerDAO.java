package com.itwillbs.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UserDTO;

@Repository
public class PartnerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.PartnerMapper";
	
	public UserDTO getPartnersy(String id, String email, String phoneNumber, String name, String password, String createdAt) {
		System.out.println("MemberDAO getPartnersy Id :::" + id);
		System.out.println("MemberDAO getPartnersy email :::" + email);
		System.out.println("MemberDAO getPartnersy phone_number :::" + phoneNumber);
		System.out.println("MemberDAO getPartnersy name :::" + name);
		System.out.println("MemberDAO getPartnersy password :::" + password);
		System.out.println("MemberDAO getPartnersy created_at :::" + createdAt);
		return sqlSession.selectOne(namespace+ ".getPartnersy", id);
	}
	
	
	
	
	

}
