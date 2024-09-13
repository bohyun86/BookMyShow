package com.itwillbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MemberService;

@RestController
public class AdminAjaxController {

	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/admin/result")
	public String result(HttpServletRequest request) {
		System.out.println("AdminAjaxController result" );
		String id = request.getParameter("user_name");
		UserDTO userDTO=memberService.getMember(id);
		JsonObject jsonObject = new JsonObject();
		String result="";
		if(userDTO!=null) {
			result="noInfo";
		}else {
			result="okInfo";
//			jsonObject.put("id", id);
//			json.put("name", id+"회원명");
//			json.put("age", id+"회원나이");
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}//
