package com.itwillbs.controller;


import java.time.LocalDate;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.MusicalDetatilDTO;
import com.itwillbs.domain.MusicalMainDTO;
import com.itwillbs.service.MusicalService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/musical/*")
public class MusicalController {

	
	@Autowired
	MusicalService musicalService;
	
	
  @RequestMapping("/page_main")
   public String musicalPage_main(
		   @RequestParam(required = false) String genreValue,
		   @RequestParam(required = false) String regionValue,
		   @RequestParam(required = false) String sortValue,
		   Model model) {
	  log.info("musical page_main success");
      
	  MusicalMainDTO musicalMainDTO = new MusicalMainDTO();
	  
	  System.out.println("지역명 : "+ regionValue);
	  
	  if (genreValue != null) {
		  if(genreValue == "") {
			  musicalMainDTO.setGenreCheck(null);
		  }
	        musicalMainDTO.setGenreCheck(genreValue);
	    }
	  if (regionValue != null) {
	    	musicalMainDTO.setRegionCheck("true");
	    	musicalMainDTO.setRegion_name1(regionValue);	
	        if(regionValue.equals("경기")) {
	        	musicalMainDTO.setRegion_name1("경기");
	        	musicalMainDTO.setRegion_name2("인천");
	        }else if(regionValue.equals("충청")) {
	        	musicalMainDTO.setRegion_name1("충청");
	        	musicalMainDTO.setRegion_name2("대전");
	        	musicalMainDTO.setRegion_name3("세종");
	        }else if(regionValue.equals("경상")) {
	        	musicalMainDTO.setRegion_name1("경상");
	        	musicalMainDTO.setRegion_name2("대구");
	        	musicalMainDTO.setRegion_name3("부산");
	        	musicalMainDTO.setRegion_name4("울산");
	        }else if(regionValue.equals("전라")) {
	        	musicalMainDTO.setRegion_name1("전라");
	        	musicalMainDTO.setRegion_name2("광주");
	        }
	    }

	    if (sortValue != null) {
	        if(sortValue.equals("reviewcheck")) {
	        	musicalMainDTO.setReviewCheck(sortValue);
	        }else {
	        	musicalMainDTO.setRatingCheck(sortValue);
	        }
	    }
	  
	  
	  
	  model.addAttribute("getMusical", musicalService.getMusical_Page(musicalMainDTO));
	  
	  
       return "/musical/page_main" ;
    }

  
  	@RequestMapping("/page_detail")
  	public String musicalPage_detail( Model model,
  			@RequestParam(required = false) String musical_id) throws JsonProcessingException {
	  System.out.println("뮤지컬id = "+musical_id);
	  
	  model.addAttribute("musical_file", musicalService.getMusicalFile(musical_id));
	  model.addAttribute("performace_date", musicalService.getPerformance_date(musical_id));
	  model.addAttribute("musical_detail", musicalService.getMusicalDetail(musical_id));
	 
	  List<String> selectableDates = musicalService.getSelectableDates(musical_id);
	  
	  ObjectMapper objectMapper = new ObjectMapper();
	  String selectableDatesJson = objectMapper.writeValueAsString(selectableDates);
	    
	  model.addAttribute("selectableDates", selectableDatesJson);
      
  		return "/musical/page_detail";
  	}
  	


}
