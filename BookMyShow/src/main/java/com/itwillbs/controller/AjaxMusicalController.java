package com.itwillbs.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MusicalTicketDTO;
import com.itwillbs.service.MusicalService;

@RestController
@RequestMapping("/musical/*")
public class AjaxMusicalController {

	@Autowired
	MusicalService musicalService;
	
	@GetMapping("/getMusicalTickets")
	public List<MusicalTicketDTO> getMusicalTickets(@RequestParam int musical_id, @RequestParam String dateValue) {
		
		System.out.println("ajax musical_id : " + musical_id);
		System.out.println("ajax dateValue : " + dateValue);
		
		MusicalTicketDTO musicalTicketDTO = new MusicalTicketDTO();
		
		musicalTicketDTO.setMusical_id(musical_id);
		musicalTicketDTO.setDateValue(dateValue);
		
		
		return musicalService.getMusicalTickets(musicalTicketDTO); 
	}
	
}
