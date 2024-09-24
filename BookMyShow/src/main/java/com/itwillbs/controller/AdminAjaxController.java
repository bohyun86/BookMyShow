package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.PartnerQnaDTO;
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
	
//	
//	@RequestMapping("/admin/result")
//	public Map<String, Object> result(HttpServletRequest request) {
//		System.out.println("partnerqna");
//	    String id = request.getParameter("user_name");
//
//	    // UserDTO 가져오기
//	    UserDTO userDTO = memberService.getMember(id); // ID로 UserDTO 가져오는 메소드 필요;
//	    System.out.println("AdminAjaxController userDTO"+userDTO);
//	    // PartnerDTO 가져오기
//	    PartnerDTO partnerDTO = partnersServiceAdmin.getPartnersy(id); // ID로 PartnerDTO 가져오는 메소드 필요
//	    System.out.println("AdminAjaxController partnerDTO"+partnerDTO);
//
//	    List<PartnerQnaDTO> partnerQnaDTO = partnersServiceAdmin.getPartneQna(id);
//	    System.out.println("AdminAjaxController partnerQnaDTO"+partnerQnaDTO);
//	    // 응답할 데이터 준비
//	    Map<String, Object> response = new HashMap<>();
//	    response.put("user", userDTO);
//	    response.put("partner", partnerDTO);
//	    response.put("partnerQna", partnerQnaDTO);
//	    
////	    if (partnerQnaDTO == null || partnerQnaDTO.isEmpty()) {
////	        System.out.println("partnerQnaDTO is null or empty");
////	    } else {
////	        System.out.println("partnerQnaDTO has data: " + partnerQnaDTO);
////	    }
//
//	    return response; // JSON 형태로 반환
//	}
	
	
	
	@GetMapping("/admin/result")
	public UserDTO results(HttpServletRequest request) {
		System.out.println("AdminAjaxController result" );
		String id = request.getParameter("user_name");
		String email = request.getParameter("eamil");
		String phoneNumber = request.getParameter("phone_number");
		String name = request.getParameter("name");
		String createdAt = request.getParameter("createdAt");
		String password = request.getParameter("password");
		String user_role = request.getParameter("user_role");
		UserDTO userDTO = memberService.getMember(id,email,phoneNumber,name,password,createdAt,user_role);
//		System.out.println("AdminAjaxController::"+email);
//		System.out.println("AdminAjaxController::"+password);
//		System.out.println("AdminAjaxController::"+createdAt);
//		System.out.println("AdminAjaxController::"+name);
//		System.out.println("AdminAjaxController::"+phoneNumber);
//		System.out.println("AdminAjaxController::"+id);
//		System.out.println("AdminAjaxController::"+user_role);
//		System.out.println("AdminAjaxController::"+userDTO);
//		JsonObject jsonObject = new JsonObject();
		//result="okinfo";
		
		return userDTO;
		
	} //  회원검색
	
	@GetMapping("/admin/partnerresult")
	public PartnerDTO partnerresult(HttpServletRequest request) {
		System.out.println("AdminAjaxController partnerresult" );
		String id = request.getParameter("user_name");
		String email = request.getParameter("eamil");
		String phoneNumber = request.getParameter("phone_number");
		String name = request.getParameter("name");
		String createdAt = request.getParameter("created_at");
		String password = request.getParameter("password");
		String user_role = request.getParameter("user_role");
		String company_name = request.getParameter("company_name");
		String business_id = request.getParameter("business_id");
		String account_number = request.getParameter("account_number");
		String bankName = request.getParameter("bankName");
//		UserDTO userDTO = partnersServiceAdmin.getPartnersy(company_name,id,email,phoneNumber,name,password,createdAt,user_role);
		PartnerDTO partnerDTO = partnersServiceAdmin.getPartnersy(id,password,company_name,name,business_id,account_number,bankName,email,createdAt);
		System.out.println("AdminAjaxController::"+email);
//		System.out.println("AdminAjaxController::"+password);
//		System.out.println("AdminAjaxController::"+createdAt);
//		System.out.println("AdminAjaxController::"+name);
//		System.out.println("AdminAjaxController::"+phoneNumber);
//		System.out.println("AdminAjaxController::"+id);
//		System.out.println("AdminAjaxController::"+user_role);
//		System.out.println("AdminAjaxController::"+company_name);
//		System.out.println("AdminAjaxController::"+userDTO);
//		JsonObject jsonObject = new JsonObject();
		
		
		return partnerDTO;
		
	} // 파트너검색
//	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//
