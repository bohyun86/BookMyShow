

package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MusicalDetatilDTO;
import com.itwillbs.domain.MusicalFileDTO;
import com.itwillbs.domain.MusicalMainDTO;
import com.itwillbs.domain.MusicalTicketDTO;
import com.itwillbs.domain.PerformanceDetailDTO;
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

	public MusicalDetatilDTO getMusicalDetail(String musical_id) {
		
		return sqlSession.selectOne(namespace + ".getMusicalDetail", musical_id);
	}

	public List<PerformanceDetailDTO> getPerformance_date(String musical_id) {
		
		return sqlSession.selectList(namespace + ".getPerformance_date" ,musical_id);
	}

	public List<MusicalFileDTO> getMusicalFile(String musical_id) {
		
		return sqlSession.selectList(namespace + ".getMusicalFile", musical_id);
	}

	public List<MusicalTicketDTO> getMusicalTickets(MusicalTicketDTO musicalTicketDTO) {
		
		return sqlSession.selectList(namespace + ".getMusicalTickets", musicalTicketDTO);
	}

	



	
}

