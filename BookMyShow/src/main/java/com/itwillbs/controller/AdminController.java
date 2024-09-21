package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.PartnerQnaDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MusicalService;
import com.itwillbs.service.PartnersServiceAdmin;
import com.itwillbs.service.UserServiceImpl;

@Controller
@Log4j2
@RequestMapping("/admin")
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class AdminController {
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	private MusicalService musicalService;
	
	private PartnersServiceAdmin partnersServiceAdmin;
	
	
	
    
    
    @GetMapping("/main")
    public String home() {
        log.info("admin main success");

        return "/admin/main";
    }
    
    @GetMapping("/login")
    public String login() {
        log.info("admin login success");

        return "/admin/login";
    }
    
    @PostMapping("/loginPro")
    public String loginPro(UserDTO userDTO , HttpSession session) {
        log.info("admin loginPro success");
        UserDTO getUser = userServiceImpl.loginPro(userDTO);
        log.info(getUser);
        if (getUser == null) {
            return "redirect:/admin/login";
        } else {
            log.info(getUser);
            session.setAttribute("userId", getUser.getUserId());
            session.setAttribute("userRole", getUser.getUserRole());
            session.setAttribute("userName", getUser.getUserName());
            return "redirect:/admin/main/";
        }
        
    }
    
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        log.info("admin logout success");
        session.invalidate();

        return "/main/main";
    }

    
    


    @GetMapping("/search")
    public String search(HttpServletRequest request,Model model) {
//    	
    	
		return "/admin/search";
    	
    	
    }

    
    @PostMapping("/searchBy")
    public String searchBy(HttpServletRequest request,Model model) {
    
    log.info("admin searchBy:: success");
	 String searchType = request.getParameter("findType");
    String findKeyword = request.getParameter("findKeyword");
	System.out.println("AdminController searchType::"+searchType);
	System.out.println("AdminController findKeyword::"+findKeyword);
	
	if ("1".equals(searchType)) {
		List<MusicalDTO> musicalList = musicalService.getMusicalByPartnerId(findKeyword);
		if (musicalList != null && !musicalList.isEmpty()) {
			model.addAttribute("musicalList", musicalList);
           System.out.println("AdminController searchBy1::"+musicalList);
           

           return "redirect:/admin/submit";
       } else {
           return "redirect:/admin/search";
       }
	}
	else if ("2".equals(searchType)) {
    		MusicalDTO musicalDTO = musicalService.getMusicalByTitle(findKeyword);
    	if(musicalDTO!= null){
    		System.out.println("AdminController searchBy2::"+musicalDTO);
            return "redirect:/admin/submit";
            
        }
    	else {
			
    		return "redirect:/admin/search";
    	}
    	}
       
   
//	return musicalList; 
	return findKeyword;
    }

    
    


    @GetMapping("/submit")
    public String submit(HttpServletRequest request,Model model) {
    	log.info("admin submit:: success");
    	
    		return "/admin/submit";
    	
    	
    }

    
    
    
    
    
    
    




    @GetMapping("/edit")
    public String edit() {
    	log.info("admin edit success");
    	return "/admin/edit";
    }

    @GetMapping("/editPro")
    public String editPro() {
    	log.info("admin editPro success");


    	return "/admin/editPro";
    }





    @GetMapping("/partner")
    public String partner() {
    	log.info("admin partner success");
    	
    	
    	
    	return "/admin/partner";
    }

    @GetMapping("/partner_submit")
    public String partner_submit() {
    	log.info("admin partner_submit success");
    	return "/admin/partner_submit";
    }
    
    @GetMapping("/partnerPro")
    public String  partnerPro(@RequestParam("userName") String userName,
            @RequestParam("password") String password,
            @RequestParam("name") String name,
            @RequestParam("companyName") String companyName,
            @RequestParam("businessId") String businessId,
            @RequestParam("accountNumber") String accountNumber,
            @RequestParam("bankName") String bankName,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("email") String email,
            @RequestParam("createdAt") String createdAt,
            Model model) {
    	log.info("admin partnerPro success");
    	
    	model.addAttribute("userName", userName);
        model.addAttribute("password", password);
        model.addAttribute("name", name);
        model.addAttribute("companyName", companyName);
        model.addAttribute("businessId", businessId);
        model.addAttribute("accountNumber", accountNumber);
        model.addAttribute("bankName", bankName);
        model.addAttribute("phoneNumber", phoneNumber);
        model.addAttribute("email", email);
        model.addAttribute("createdAt", createdAt);
    	
    	
    	return "/admin/partnerPro";
    } //parter에서 ajax에서 가져온 값을 admincontroller로 넘겨서 partnerPro로 넘기는 과정
    
    
    
    
    @GetMapping("/partner_qna")
    public String partner_qna() {
    	log.info("admin partner_qna success");
    	return "/admin/partner_qna";
    }
    
    

    @GetMapping("/partner_settlement")
    public String partner_settlement() {
    	log.info("admin partner_settlement success");
    	return "/admin/partner_settlement";
    }



    @GetMapping("/member")
    public String member() {
    	log.info("admin member success");
    	return "/admin/member";
    }

    
    @GetMapping("/memberPro")
    public String memberPro() {
    	log.info("admin memberPro success");
    	return "/admin/memberPro";
    }

    @GetMapping("/booking")
    public String booking() {
    	log.info("admin booking success");
    	return "/admin/booking";
    }

    @GetMapping("/payment")
    public String payment() {
    	log.info("admin payment success");
    	return "/admin/payment";
    }



    @GetMapping("/support")
    public String support() {
    	log.info("admin support success");
    	return "/admin/support";
    }













}//
