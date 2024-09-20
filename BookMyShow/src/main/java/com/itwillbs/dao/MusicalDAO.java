package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import com.itwillbs.domain.MusicalMainDTO;

@Repository
public class MusicalDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mapper.MusicalMapper.";
	
	
	public List<MusicalMainDTO> getMusical(MusicalMainDTO musicalMainDTO) {
		
		
		return sqlSession.selectList(namespace + "getMusical", musicalMainDTO);
	}



}
