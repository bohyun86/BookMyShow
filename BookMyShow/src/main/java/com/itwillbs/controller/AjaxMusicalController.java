package com.itwillbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MusicalTicketDTO;
import com.itwillbs.service.MusicalService;

@RestController
public class AjaxMusicalController {

	@Autowired
	MusicalService musicalService;
	
	@RequestMapping("/musical/getMusicalTickets")
	public List<MusicalTicketDTO> getMusicalTickets(){
		
		
		return musicalService.getMusicalTickets();
	}
	
}
