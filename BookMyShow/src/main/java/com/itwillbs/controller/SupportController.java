package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SupportNoticeDTO;
import com.itwillbs.domain.SupportqnaDTO;
import com.itwillbs.service.SupportService;

@Controller
@Log4j2
@RequestMapping("/support/*")
public class SupportController {
	
	@Autowired  
	private SupportService supportService;

    @GetMapping("/faq")
    public String faq() {
        log.info("faq success");

        return "/support/frequentQuestion";
    }
    
    @GetMapping("/support/ntwrite")
	public String ntwrite() {
    	log.info("ntwrite success");

		return "/support/ntwrite";
	}
    
    @PostMapping("support/ntwritePro")
	public String ntwritePro(SupportNoticeDTO supportNoticeDTO) {
		System.out.println("SupportController ntwritePro()");
		System.out.println(supportNoticeDTO);
		supportService.insertNotice(supportNoticeDTO);
		return "redirect:/support/notice";
	}
    
    @GetMapping("/notice")
	public String notice(HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		int pageSize = 10;
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		List<SupportNoticeDTO> noticeList = supportService.getNoticeList(pageDTO);
				
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/support/notice";
	}
	
    
    @GetMapping("/support/frequentQuestion")
   	public String frequentQuestion(HttpServletRequest request, Model model) {
       	log.info("frequentQuestion success");
       	String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		int pageSize = 10;
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		List<SupportqnaDTO> qnaList = supportService.getQnaList(pageDTO);
				
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageDTO", pageDTO);
		
   		return "/support/frequentQuestion";
   	}
    
    @GetMapping("/support/qnawrite")
	public String qnawrite() {
    	log.info("qnawrite success");

		return "/support/qnawrite";
	}
    
    @PostMapping("support/qnawritePro")
	public String qnawritePro(SupportqnaDTO supportqnaDTO) {
		System.out.println("SupportController ntwritePro()");
		System.out.println(supportqnaDTO);
		supportService.insertQna(supportqnaDTO);
		return "redirect:/support/frequentQuestion";
	}
    
    @GetMapping("/support/inquiry")
	public String inquiry() {
    	log.info("inquiry success");

		return "/support/inquiry";
	}
}
