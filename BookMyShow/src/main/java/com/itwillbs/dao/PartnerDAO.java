package com.itwillbs.dao;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.PartnerQnaDTO;
import com.itwillbs.domain.UserDTO;

@Repository
public class PartnerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.PartnerAdminMapper";
	
	public UserDTO getPartnersy(String id, String email, String phoneNumber, String name, String password, String createdAt,String user_role) {
		System.out.println("PartnerDAO getPartnersy Id :::" + id);
		System.out.println("PartnerDAO getPartnersy email :::" + email);
		System.out.println("PartnerDAO getPartnersy phone_number :::" + phoneNumber);
		System.out.println("PartnerDAO getPartnersy name :::" + name);
		System.out.println("PartnerDAO getPartnersy password :::" + password);
		System.out.println("PartnerDAO getPartnersy created_at :::" + createdAt);
		System.out.println("PartnerDAO getPartnersy user_role :::" + user_role);
		return sqlSession.selectOne(namespace+ ".getPartnersy", id);
	}

	
	public PartnerDTO getPartnersy(String id) {
		System.out.println("PartnerDAO"+id);
		return sqlSession.selectOne(namespace+".getPartnersy", id);
	}
	
	public List<PartnerQnaDTO> getPartneQna(String  id) {
	    System.out.println("PartnerDAO::" +  id);
	    List<PartnerQnaDTO> result = sqlSession.selectList(namespace + ".getPartneQna", id);
	    System.out.println("Retrieved PartnerQnaDTO List: " + result);

	    return result;
	}
	
	
	

}
