package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.PageDTO;
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
    
    @GetMapping("/support/notice")
	public String notice() {
    	log.info("notice success");

		return "/support/notice";
	}
    
    @GetMapping("/notice")
	public String list(HttpServletRequest request, Model model) {
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
		
		List<PageDTO> supportList = supportService.getSupportList(pageDTO);

		int count = supportService.getSupportCount(pageDTO);

		int pageBlock = 5;

		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;

		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
				
		model.addAttribute("supportList", supportList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/support/notice";
	}
	
    
    @GetMapping("/support/frequentQuestion")
   	public String frequentQuestion() {
       	log.info("frequentQuestion success");

   		return "/support/frequentQuestion";
   	}
    
    @GetMapping("/support/inquiry")
	public String inquiry() {
    	log.info("inquiry success");

		return "/support/inquiry";
	}
}
