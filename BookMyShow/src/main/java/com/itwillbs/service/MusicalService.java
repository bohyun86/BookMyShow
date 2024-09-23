
package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MusicalDAO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.MusicalMainDTO;


@Service
public class MusicalService {

	@Autowired
	private MusicalDAO musicalDAO;
	
	
	public List<MusicalMainDTO> getMusical_Page(MusicalMainDTO musicalMainDTO) {
		
		
		return  musicalDAO.getMusical_Page(musicalMainDTO);
			
	}


	public com.itwillbs.domain.Performance.MusicalDTO getMusicalByTitle(String findKeyword) {
		System.out.println("MusicalService getMusicalByTitle::"+findKeyword);
		return musicalDAO.getMusicalByTitle(findKeyword);
	}
//��Ʈ���ʾ��̵�� �˻�
	public List<com.itwillbs.domain.Performance.MusicalDTO> getMusicalByPartnerId(String findKeyword) {
		System.out.println("MusicalService getMusicalByPartnerId::"+findKeyword);
		return musicalDAO.getMusicalByPartnerId(findKeyword);
	}
	public void updateMusicalApproval(int approved) {
		// TODO Auto-generated method stub
		System.out.println("MusicalService updateMusicalApproval::"+approved);
		 musicalDAO.updateMusicalApproval(approved);
	}
	public com.itwillbs.domain.Performance.MusicalDTO getMusical(String title) {
		// TODO Auto-generated method stub
		System.out.println("MusicalService getMusical::"+title);
		return musicalDAO.getMusical(title);
	}

}


