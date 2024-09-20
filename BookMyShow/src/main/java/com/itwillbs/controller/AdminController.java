package com.itwillbs.controller;

import com.itwillbs.domain.Performance.AttachFile2DTO;
import com.itwillbs.domain.Performance.PerformanceTempDTO;
import com.itwillbs.domain.partner.PartnerStatusDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.PartnerService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MusicalService;
import com.itwillbs.service.UserServiceImpl;

@Controller
@Log4j2
@RequestMapping("/admin")
@EnableAspectJAutoProxy(proxyTargetClass = true)
@AllArgsConstructor // lombok을 이용한 생성자 자동 생성
public class AdminController {

    private UserServiceImpl userServiceImpl;
    private MusicalService musicalService;
    private AdminService adminService;
    private PartnerService partnerService;


    @GetMapping("/editProTEST")
    public String editProTEST() {
        log.info("admin editProTEST success");

        return "/admin/editProTEST";
    }

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
    public String loginPro(UserDTO userDTO, HttpSession session) {
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
    public String search(HttpServletRequest request, Model model) {
//    	

        return "/admin/search";


    }


    @PostMapping("/searchBy")
    public String searchBy(HttpServletRequest request, Model model) {

        log.info("admin searchBy:: success");
        String searchType = request.getParameter("findType");
        String findKeyword = request.getParameter("findKeyword");
        System.out.println("AdminController searchType::" + searchType);
        System.out.println("AdminController findKeyword::" + findKeyword);

        if ("1".equals(searchType)) {
            List<MusicalDTO> musicalList = musicalService.getMusicalByPartnerId(findKeyword);
            // ��Ʈ�� ID�� �˻�
            if (musicalList != null && !musicalList.isEmpty()) {
                // ����Ʈ�� ù ��° �׸��� ������ URL �Ķ���ͷ� ���
                model.addAttribute("musicalList", musicalList);
                System.out.println("AdminController searchBy1::" + musicalList);


                return "redirect:/admin/submit";
            } else {
//       	model.addAttribute("msg", "내역이 없습니다");
                // ����Ʈ�� ������� ��� ó��
//       	model.addAttribute("url", "/admin/search");
                return "redirect:/admin/search";
            }
        } else if ("2".equals(searchType)) {
            MusicalDTO musicalDTO = musicalService.getMusicalByTitle(findKeyword);
//    		UserDTO userDTO = 
//    		System.out.println("userDTO"+userDTO);
            if (musicalDTO != null) {
                // ������ �������� �˻�
//        	musicalDTO = musicalService.getMusicalByTitle(findKeyword);
                System.out.println("AdminController searchBy2::" + musicalDTO);
                return "redirect:/admin/submit";

            } else {

                return "redirect:/admin/search";
            }
        }


//	return musicalList; 
        return findKeyword;
    }


    @GetMapping("/submit")
    public String submit(HttpServletRequest request, Model model) {
        log.info("admin submit:: success");

        return "/admin/submit";


    }


    @GetMapping("/edit")
    public String edit(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model) {
        log.info("admin edit success");

        Page<PartnerStatusDTO> musicals = adminService.getMusicals(page - 1, size);

        model.addAttribute("musicals", musicals); // 뮤지컬 리스트
        model.addAttribute("currentPage", page); // 현재 페이지 번호
        model.addAttribute("totalPages", musicals.getTotalPages()); // 총 페이지 수
        model.addAttribute("totalElements", musicals.getTotalElements()); // 총 항목 수


        return "/admin/edit";
    }

    @GetMapping("/editPro")
    public String editPro(@RequestParam int musicalId, Model model) {
        log.info("admin editPro success");
        PerformanceTempDTO performanceTempDTO = partnerService.getPerformanceTemp(musicalId);
        List<AttachFile2DTO> attachFileDTO = partnerService.getAttachFileByMusicalId(musicalId);

        log.info("attachFileDTO: {}", attachFileDTO);

        model.addAttribute("performanceTempDTO", performanceTempDTO);
        model.addAttribute("attachFileDTO", attachFileDTO);


        return "/admin/editPro";
    }

    @GetMapping("/approvePro")
    public String approvePro(@RequestParam int musicalId, Model model) {
        log.info("admin approvePro success");



        return "redirect:/admin/edit";
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
