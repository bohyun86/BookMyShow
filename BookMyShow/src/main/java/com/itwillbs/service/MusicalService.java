package com.itwillbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MusicalDAO;
import com.itwillbs.domain.MusicalDTO;

@Service
public class MusicalService {
	
	@Autowired
	private MusicalDAO musicalDAO;
	
	// 뮤지컬 승인 상태 업데이트
    public void updateMusicalApproval(int approved) {
    	System.out.println("musicalDAO::"+approved);
        musicalDAO.updateMusicalApproval(approved);
    }

	public MusicalDTO getMusicalByTitle(String findKeyword) {
		System.out.println("musicalDAO::"+findKeyword);
		return musicalDAO.getMusicalByTitle(findKeyword);
	}

	

}
