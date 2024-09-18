package com.itwillbs.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MusicalDTO;

@Repository
public class MusicalDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.MusicalMapper";
	
	// ������ ���� ���� ������Ʈ
    public void updateMusicalApproval(int approved) {
    	System.out.println("MusicalDAO::"+approved);
    	sqlSession.update(namespace+".updateMusicalApproval",approved);
    }
	
//	 // ��Ʈ�� ID�� ������ �˻�
//    public MusicalDTO getMusicalByPartnerId(String partnerId) {
//        return musicalMapper.getMusicalByPartnerId(partnerId);
//    }

    // ������ �������� �˻�
    public MusicalDTO getMusicalByTitle(String findKeyword) {
    	System.out.println("MusicalDAO::"+findKeyword);
    	return sqlSession.selectOne(namespace+ ".getMusicalByTitle", findKeyword);
    }
	
	
	
	
}
