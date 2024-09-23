package com.itwillbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


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
  





}
