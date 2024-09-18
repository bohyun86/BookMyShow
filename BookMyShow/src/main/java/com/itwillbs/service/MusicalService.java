package com.itwillbs.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MusicalDAO;
import com.itwillbs.domain.GenreDTO;
import com.itwillbs.domain.MusicalDTO;

@Service
public class MusicalService {

	@Autowired
	private MusicalDAO musicalDAO;
	
	
	public List<MusicalDTO> getMusical() {
		
		
		return  musicalDAO.getMusical();
		
	}


	public List<GenreDTO> getGenre() {
		
		return musicalDAO.getGenre();
	}

}
