package com.itwillbs.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MusicalDAO;


import com.itwillbs.domain.MusicalMainDTO;

@Service
public class MusicalService {

	@Autowired
	private MusicalDAO musicalDAO;
	
	
	public List<MusicalMainDTO> getMusical(MusicalMainDTO musicalMainDTO) {
		
		
		return  musicalDAO.getMusical(musicalMainDTO);
		
	}


	

}
