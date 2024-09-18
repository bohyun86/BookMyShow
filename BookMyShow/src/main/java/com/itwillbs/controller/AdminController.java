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
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MusicalService;
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
    	log.info("admin search:: success");
    	 String searchType = request.getParameter("findType");
         String findKeyword = request.getParameter("findKeyword");
    	System.out.println("AdminController searchType::"+searchType);
    	System.out.println("AdminController findKeyword::"+findKeyword);
    	
    	if ("1".equals(searchType)) {
            // ��Ʈ�� ID�� �˻�
//    		MusicalDTO musicalDTO = new MusicalDTO();
    		List<MusicalDTO> musicalList = musicalService.getMusicalByPartnerId(findKeyword);
    		if (musicalList != null && !musicalList.isEmpty()) {
                // ����Ʈ�� ù ��° �׸��� ������ URL �Ķ���ͷ� ���
                System.out.println("musicalList"+musicalList);

                return "redirect:/admin/submit?user_name=" + musicalList;
            } else {
                // ����Ʈ�� ������� ��� ó��
                return "redirect:/admin/submit?message=NoResults";
            }
//            model.addAttribute("submit", musicalList);
//            return "redirect:/admin/submit?user_name";
//            return "redirect:/admin/submit?user_name=" +musicalList.getMusical();
            
        } else if ("2".equals(searchType)) {
        	MusicalDTO musicalDTO2 = new MusicalDTO();
            // ������ �������� �˻�
        	musicalDTO2 = musicalService.getMusicalByTitle(findKeyword);
            return "redirect:/admin/submit?title=" + musicalDTO2.getMusical();
        }
    	
    	// �˻� ����� �ִ��� Ȯ��
//        if (musicalDTO != null) {
//            // �˻��� �������� ���� �������� �����̷�Ʈ
//            return "redirect:/musical/sumbit?title=" + musicalDTO.getMusical();
//        } else {
//            // �˻� ����� ���� ��� �˻� �������� �ٽ� �����̷�Ʈ
//            model.addAttribute("message", "�ش� �������� ã�� �� �����ϴ�.");
//            return "redirect:/admin/search";
//        }
//    	
    	return "/admin/search";
    }





    @GetMapping("/submit")
    public String submit() {
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
    public String partnerPro() {
    	log.info("admin partnerPro success");
    	return "/admin/partnerPro";
    }

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
