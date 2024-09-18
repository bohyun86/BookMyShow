package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;
import com.mysql.cj.xdevapi.Result;



@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.MemberMapper";

	public UserDTO getMember(String id, String email, String phoneNumber, String name, String password, String createdAt) {
		System.out.println("MemberDAO getMember");
		System.out.println("MemberDAO Id :::" + id);
		System.out.println("MemberDAO email :::" + email);
		System.out.println("MemberDAO phone_number :::" + phoneNumber);
		System.out.println("MemberDAO name :::" + name);
		System.out.println("MemberDAO password :::" + password);
		System.out.println("MemberDAO created_at :::" + createdAt);
		return sqlSession.selectOne(namespace+ ".getMember", id);
	}
	
}

	
