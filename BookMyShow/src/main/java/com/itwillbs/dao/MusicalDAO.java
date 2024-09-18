package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.GenreDTO;
import com.itwillbs.domain.MusicalDTO;

@Repository
public class MusicalDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mapper.MusicalMapper.";
	
	
	public List<MusicalDTO> getMusical() {
		
		
		return sqlSession.selectList(namespace + "getMusical");
	}


	public List<GenreDTO> getGenre() {
		
		return sqlSession.selectList(namespace + "getGenre");
	}

}
