package com.itwillbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.PartnerService;
import com.itwillbs.service.PartnersServiceAdmin;

@RestController
public class AdminAjaxController {

	
	@Autowired
	private MemberService memberService;
	
	private PartnersServiceAdmin partnersServiceAdmin; 
	
	@GetMapping("/admin/result")
	public UserDTO result(HttpServletRequest request) {
		System.out.println("AdminAjaxController result" );
		String id = request.getParameter("user_name");
		String email = request.getParameter("eamil");
		String phoneNumber = request.getParameter("phone_number");
		String name = request.getParameter("name");
		String createdAt = request.getParameter("createdAt");
		String password = request.getParameter("password");
		UserDTO userDTO = memberService.getMember(id,email,phoneNumber,name,password,createdAt);
		System.out.println("AdminAjaxController::"+email);
		System.out.println("AdminAjaxController::"+password);
		System.out.println("AdminAjaxController::"+createdAt);
		System.out.println("AdminAjaxController::"+name);
		System.out.println("AdminAjaxController::"+phoneNumber);
		System.out.println("AdminAjaxController::"+id);
		System.out.println("AdminAjaxController::"+userDTO);
//		JsonObject jsonObject = new JsonObject();
		//result="okinfo";
		
		return userDTO;
		
	}
	
	@GetMapping("/admin/partnerresult")
	public UserDTO partnerresult(HttpServletRequest request) {
		System.out.println("AdminAjaxController partnerresult" );
		String id = request.getParameter("user_name");
		String email = request.getParameter("eamil");
		String phoneNumber = request.getParameter("phone_number");
		String name = request.getParameter("name");
		String createdAt = request.getParameter("createdAt");
		String password = request.getParameter("password");
		UserDTO userDTO = partnersServiceAdmin.getPartnersy(id,email,phoneNumber,name,password,createdAt);
		System.out.println("AdminAjaxController::"+email);
		System.out.println("AdminAjaxController::"+password);
		System.out.println("AdminAjaxController::"+createdAt);
		System.out.println("AdminAjaxController::"+name);
		System.out.println("AdminAjaxController::"+phoneNumber);
		System.out.println("AdminAjaxController::"+id);
		System.out.println("AdminAjaxController::"+userDTO);
//		JsonObject jsonObject = new JsonObject();
		//result="okinfo";
		
		return userDTO;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}//
