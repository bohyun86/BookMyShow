package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SupportNoticeDTO;

@Repository
public class SupportDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
private static final String namespace="com.itwillbs.mapper.SupportMapper";
	
public Integer getMaxNum() {
	System.out.println("SupportDAO getMaxNum()");
	return sqlSession.selectOne(namespace + ".getMaxNum");
}

public void insertNotice(SupportNoticeDTO supportNoticeDTO) {
	System.out.println("SupportDAO insertNotice()");
	System.out.println(supportNoticeDTO);
	
	sqlSession.insert(namespace + ".insertNotice", supportNoticeDTO);
}

public List<SupportNoticeDTO> getNoticeList(PageDTO pageDTO) {
	System.out.println("SupportDAO getNoticeList()");
	
	return sqlSession.selectList(namespace + ".getNoticeList", pageDTO);
}

}
