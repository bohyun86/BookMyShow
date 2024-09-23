package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SupportNoticeDTO;
import com.itwillbs.domain.SupportinquiryDTO;
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
	public String notice(HttpServletRequest request, Model model, HttpSession session) {
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
		
		int count = supportService.getNoticeCount(pageDTO);
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
				
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/support/notice";
	}
	
    @GetMapping("/support/ntcontent")
	public String ntcontent(@RequestParam("notice_id") int notice_id, Model model) {
    	log.info("ntcontent success");
        SupportNoticeDTO supportNoticeDTO = supportService.getNotice(notice_id);
		
		model.addAttribute("supportNoticeDTO", supportNoticeDTO);
		return "/support/ntcontent";
	}
    
    @GetMapping("/support/ntupdate")
	public String ntupdate(@RequestParam("notice_id") int notice_id, Model model) {
    	log.info("ntupdate success");
    	SupportNoticeDTO supportNoticeDTO = supportService.getNotice(notice_id);
    	
		model.addAttribute("supportNoticeDTO", supportNoticeDTO);
		return "/support/ntupdate";
	}
    
    @PostMapping("support/ntupdatePro")
	public String ntupdatePro(SupportNoticeDTO supportNoticeDTO){
		System.out.println("SupportController ntupdatePro()");
		System.out.println(supportNoticeDTO);

		supportService.updateNotice(supportNoticeDTO);
		
		return "redirect:/support/notice";
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
		
		int count = supportService.getQnaCount(pageDTO);
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
		System.out.println("SupportController qnawritePro()");
		System.out.println(supportqnaDTO);
		supportService.insertQna(supportqnaDTO);
		return "redirect:/support/frequentQuestion";
	}
    
    @GetMapping("/support/qnacontent")
	public String qnacontent(@RequestParam("faq_id") int faq_id, Model model) {
    	log.info("qnacontent success");
        SupportqnaDTO supportqnaDTO = supportService.getQna(faq_id);
		
		model.addAttribute("supportqnaDTO", supportqnaDTO);
		return "/support/qnacontent";
	}
    
    @GetMapping("/support/qnaupdate")
	public String qnaupdate(@RequestParam("faq_id") int faq_id, Model model) {
    	log.info("qnaupdate success");
    	SupportqnaDTO supportqnaDTO = supportService.getQna(faq_id);
    	
		model.addAttribute("supportqnaDTO", supportqnaDTO);
		return "/support/qnaupdate";
	}
    
    @PostMapping("support/qnaupdatePro")
	public String qnapdatePro(SupportqnaDTO supportqnaDTO){
		System.out.println("SupportController qnapdatePro()");
		System.out.println(supportqnaDTO);

		supportService.updateQna(supportqnaDTO);
		
		return "redirect:/support/frequentQuestion";
	}
    
    @GetMapping("/support/inquiry")
	public String inquiry(HttpServletRequest request, Model model) {
    	log.info("inquiry success");
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
		
		List<SupportinquiryDTO> inList = supportService.getInList(pageDTO);
		
		int count = supportService.getInCount(pageDTO);
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
				
		System.out.println(pageDTO);
		model.addAttribute("inList", inList);
		model.addAttribute("pageDTO", pageDTO);

		return "/support/inquiry";
	}
    
    @GetMapping("/support/inwrite")
	public String inwrite() {
    	log.info("inwrite success");

		return "/support/inwrite";
	}
    
    @PostMapping("support/inwritePro")
	public String inwritePro(SupportinquiryDTO supportinquiryDTO) {
		System.out.println("SupportController inwritePro()");
		System.out.println(supportinquiryDTO);
		supportService.insertInquiry(supportinquiryDTO);
		return "redirect:/support/inquiry";
	}
}
