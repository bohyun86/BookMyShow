package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SupportNoticeDTO;
import com.itwillbs.domain.SupportinquiryDTO;
import com.itwillbs.domain.SupportqnaDTO;

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

public int getNoticeCount(PageDTO pageDTO) {
	System.out.println("SupportDAO getNoticeCount()");
	
	return sqlSession.selectOne(namespace + ".getNoticeCount",pageDTO);
}

public Integer getMaxNum1() {
	System.out.println("SupportDAO getMaxNum1()");
	return sqlSession.selectOne(namespace + ".getMaxNum1");
}

public void insertQna(SupportqnaDTO supportqnaDTO) {
	System.out.println("SupportDAO insertQna()");
	System.out.println(supportqnaDTO);
	
	sqlSession.insert(namespace + ".insertQna", supportqnaDTO);
}

public List<SupportqnaDTO> getQnaList(PageDTO pageDTO) {
	System.out.println("SupportDAO getQnaList()");
	
	return sqlSession.selectList(namespace + ".getQnaList", pageDTO);
}

public Integer getMaxNum2() {
	System.out.println("SupportDAO getMaxNum2()");
	return sqlSession.selectOne(namespace + ".getMaxNum2");
}

public void insertInquiry(SupportinquiryDTO supportinquiryDTO) {
	System.out.println("SupportDAO insertInquiry()");
	System.out.println(supportinquiryDTO);
	
	sqlSession.insert(namespace + ".insertInquiry", supportinquiryDTO);
}

public List<SupportinquiryDTO> getInList(PageDTO pageDTO) {
	System.out.println("SupportDAO getInList()");
	
	return sqlSession.selectList(namespace + ".getInList", pageDTO);
}

}
