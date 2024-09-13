package com.itwillbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@RestController
public class AdminAjaxController {

	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/admin/result")
	public String result(HttpServletRequest request) {
		System.out.println("AdminAjaxController result" );
		String id = request.getParameter("id");
		MemberDTO memberDTO=memberService.getMember(id);
		String result="";
		if(memberDTO!=null) {
			result="noInfo";
		}else {
			result="okInfo";
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}//
