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

	public UserDTO getMember(String id) {
		System.out.println("MemberDAO getMember");
		return sqlSession.selectOne(namespace+ ".getMember", id);
	}
	
}

	
