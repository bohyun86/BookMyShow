package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.PartnerService;
import com.itwillbs.service.PartnersServiceAdmin;

@RestController
public class AdminAjaxController {

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PartnersServiceAdmin partnersServiceAdmin; 
	
	
	@GetMapping("/admin/result")
	public Map<String, Object> result(HttpServletRequest request) {
	    String id = request.getParameter("user_name");

	    // UserDTO 가져오기
	    UserDTO userDTO = memberService.getMember(id); // ID로 UserDTO 가져오는 메소드 필요;
	    System.out.println("userDTO"+userDTO);
	    // PartnerDTO 가져오기
	    PartnerDTO partnerDTO = partnersServiceAdmin.getPartnersy(id); // ID로 PartnerDTO 가져오는 메소드 필요
	    System.out.println("partnerDTO"+partnerDTO);

	    // 응답할 데이터 준비
	    Map<String, Object> response = new HashMap<>();
	    response.put("user", userDTO);
	    response.put("partner", partnerDTO);

	    return response; // JSON 형태로 반환
	}
	
	
	
//	@GetMapping("/admin/result")
//	public UserDTO result(HttpServletRequest request) {
//		System.out.println("AdminAjaxController result" );
//		String id = request.getParameter("user_name");
//		String email = request.getParameter("eamil");
//		String phoneNumber = request.getParameter("phone_number");
//		String name = request.getParameter("name");
//		String createdAt = request.getParameter("createdAt");
//		String password = request.getParameter("password");
//		String user_role = request.getParameter("user_role");
//		UserDTO userDTO = memberService.getMember(id,email,phoneNumber,name,password,createdAt,user_role);
//		System.out.println("AdminAjaxController::"+email);
//		System.out.println("AdminAjaxController::"+password);
//		System.out.println("AdminAjaxController::"+createdAt);
//		System.out.println("AdminAjaxController::"+name);
//		System.out.println("AdminAjaxController::"+phoneNumber);
//		System.out.println("AdminAjaxController::"+id);
//		System.out.println("AdminAjaxController::"+user_role);
//		System.out.println("AdminAjaxController::"+userDTO);
////		JsonObject jsonObject = new JsonObject();
//		//result="okinfo";
//		
//		return userDTO;
//		
//	}
	
	@GetMapping("/admin/partnerresult")
	public UserDTO partnerresult(HttpServletRequest request) {
		System.out.println("AdminAjaxController partnerresult" );
		String id = request.getParameter("user_name");
		String email = request.getParameter("eamil");
		String phoneNumber = request.getParameter("phone_number");
		String name = request.getParameter("name");
		String createdAt = request.getParameter("createdAt");
		String password = request.getParameter("password");
		String user_role = request.getParameter("user_role");
//		String company_name = request.getParameter("company_name");
		UserDTO userDTO = partnersServiceAdmin.getPartnersy(id,email,phoneNumber,name,password,createdAt,user_role);
		System.out.println("AdminAjaxController::"+email);
		System.out.println("AdminAjaxController::"+password);
		System.out.println("AdminAjaxController::"+createdAt);
		System.out.println("AdminAjaxController::"+name);
		System.out.println("AdminAjaxController::"+phoneNumber);
		System.out.println("AdminAjaxController::"+id);
		System.out.println("AdminAjaxController::"+user_role);
//		System.out.println("AdminAjaxController::"+company_name);
		System.out.println("AdminAjaxController::"+userDTO);
//		JsonObject jsonObject = new JsonObject();
		
		
		return userDTO;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//
