package com.itwillbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.service.MusicalService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/musical/*")
public class MusicalController {

	
	@Autowired
	MusicalService musicalService;
	
	
  @RequestMapping("/page_main")
   public String musicalPage_main(Model model) {
	  log.info("musical page_main success");
      
	
	  
	  model.addAttribute("getMusical", musicalService.getMusical());
	  
	  
       return "/musical/page_main" ;
    }
  
  @RequestMapping("/page_Daehak")
  public String musicalPage_Daehak() {
	  log.info("musical page_Daehak success");
       
      return "/musical/page_Daehak";
   }
  
  @RequestMapping("/page_Seoul")
  public String musicalPage_Seoul() {
	  log.info("musical page_Seoul success");
       
      return "/musical/page_Seoul";
   }
  
  @RequestMapping("/page_Gyeonggi")
  public String musicalPage_Gyeonggi() {
	  log.info("musical page_Gyeonggi success");
       
      return "/musical/page_Gyeonggi";
   }

  @RequestMapping("/page_Chungcheong")
  public String musicalPage_Chungcheong() {
	  log.info("musical page_Chungcheong success");
       
      return "/musical/page_Chungcheong";
   }

  @RequestMapping("/page_Gyeongsang")
  public String musicalPage_Gyeongsang() {
	  log.info("musical page_Gyeongsang success");
       
      return "/musical/page_Gyeongsang";
   }

  @RequestMapping("/page_Jeolla")
  public String musicalPage_Jeolla() {
	  log.info("musical page_Jeolla success");
       
      return "/musical/page_Jeolla";
   }
  
  @RequestMapping("/page_Gangwon")
  public String musicalPage_Gangwon() {
	  log.info("musical page_Gangwon success");
       
      return "/musical/page_Gangwon";
   }
  @RequestMapping("/page_Jeju")
  public String musicalPage_Jeju() {
	  log.info("musical page_Jeju success");
       
      return "/musical/page_Jeju";
   }

  @RequestMapping("/page_romantic")
  public String musicalPage_romantic() {
	  log.info("musical page_romantic success");
       
      return "/musical/page_romantic";
   }

  @RequestMapping("/page_comic")
  public String musicalPage_comic() {
	  log.info("musical page_comic success");
       
      return "/musical/page_comic";
   }

  @RequestMapping("/page_drama")
  public String musicalPage_drama() {
	  log.info("musical page_drama success");
       
      return "/musical/page_drama";
   }

  @RequestMapping("/page_performance")
  public String musicalPage_performance() {
	  log.info("musical page_performance success");
       
      return "/musical/page_performance";
   }

  @RequestMapping("/page_child")
  public String musicalPage_child() {
	  log.info("musical page_child success");
       
      return "/musical/page_child";
   }

  @RequestMapping("/page_other")
  public String musicalPage_other() {
	  log.info("musical page_other success");
       
      return "/musical/page_other";
   }

  @RequestMapping("/page_pop")
  public String musicalPage_pop() {
	  log.info("musical page_pop success");
       
      return "/musical/page_pop";
   }
  
  @RequestMapping("/page_star")
  public String musicalPage_star() {
	  log.info("musical page_star success");
       
      return "/musical/page_star";
   }

  @RequestMapping("/page_detail")
  public String musicalPage_detail() {
	  log.info("musical page_detail success");
       
      return "/musical/page_detail";
   }







}
