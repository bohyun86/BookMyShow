

package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.itwillbs.domain.MusicalMainDTO;
import com.itwillbs.domain.Performance.MusicalDTO;

@Repository
public class MusicalDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mapper.MusicalMapper";
	
	
	public List<MusicalMainDTO> getMusical_Page(MusicalMainDTO musicalMainDTO) {
		
		
		return sqlSession.selectList(namespace + ".getMusical_Page", musicalMainDTO);
		
	}
	
	// ������ ���� ���� ������Ʈ
    public void updateMusicalApproval(int approved) {
    	System.out.println("---MusicalDAO updateMusicalApproval::"+approved);
    	 sqlSession.update(namespace+".updateMusicalApproval",approved);
		 
		 
    }
	
//	 // ��Ʈ�� ID�� ������ �˻�
    public List<MusicalDTO> getMusicalByPartnerId(String findKeyword) {
    	System.out.println("---MusicalDAO getMusicalByPartnerId::"+findKeyword);
        return sqlSession.selectList(namespace+ ".getMusicalByPartnerId", findKeyword);
    }

    // ������ �������� �˻�
    public MusicalDTO getMusicalByTitle(String findKeyword) {
    	System.out.println("---MusicalDAO getMusicalByTitle::"+findKeyword);
    	return sqlSession.selectOne(namespace+ ".getMusicalByTitle", findKeyword);
    }

	public MusicalDTO getMusical(String title) {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne(namespace + ".getMusical", title);
	}	




	
}

