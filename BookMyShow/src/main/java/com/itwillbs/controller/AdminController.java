package com.itwillbs.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.MusicalDTO;

import com.itwillbs.domain.PartnerDTO;

import com.itwillbs.domain.PartnerQnaDTO;
import com.itwillbs.domain.Performance.AttachFile2DTO;
import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.PerformanceTempDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.partner.PartnerStatusDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.MusicalService;
import com.itwillbs.service.PartnerService;
import com.itwillbs.service.PartnersServiceAdmin;
import com.itwillbs.service.UserServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;



import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;


@Controller
@Log4j2
@RequestMapping("/admin")
@EnableAspectJAutoProxy(proxyTargetClass = true)
@AllArgsConstructor
// lombok을 이용한 생성자 자동 생성
public class AdminController {

	


	
	private PartnersServiceAdmin partnersServiceAdmin;
	
	
	
    
    


    private UserServiceImpl userServiceImpl;
    private MusicalService musicalService;
    private AdminService adminService;
    private PartnerService partnerService;
    private PartnerController partnerController;
    private ServletContext servletContext;
    private ObjectMapper objectMapper;



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
    public String approvePro(@RequestParam int musicalId) {
        log.info("admin approvePro success");

        adminService.approveMusical(musicalId);

        return "redirect:/admin/edit";
    }

    @PostMapping(value = "/writePro")
    public String writePro(PerformanceTempDTO performancetempDTO) {
        log.info("writePro: {}", performancetempDTO);

        List<AttachFileDTO> list = new ArrayList<>();
        String uploadFolder = servletContext.getRealPath("/resources/upload");

        File uploadPath = new File(uploadFolder, partnerController.getFolder());
        log.info("uploadPath: {}", uploadPath);

        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }

        // 공연 상세정보 이미지 처리
        MultipartFile[] musicalImages = performancetempDTO.getMusicalImages();

        if (musicalImages[0].getSize() != 0) {
            for (MultipartFile musicalImage : musicalImages) {
                partnerController.uploadImages(musicalImage, uploadPath, list, false);
            }
        }

        // 공연 포스터 이미지 처리
        MultipartFile musicalPost = performancetempDTO.getMusicalPost();
        if (musicalPost.getSize() != 0) {
            partnerController.uploadImages(musicalPost, uploadPath, list, true);
        }
        // 임시 공연 등록

        partnerService.registerPerformance(performancetempDTO, list);

        return "redirect:/admin/edit";
    }

    @GetMapping("/deletePro")
    public String deletePro(@RequestParam int musicalId) {
        log.info("deletePro: {}", musicalId);

        partnerService.deletePerformance(musicalId);

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
    public String partner_qna(Model model) {
    	log.info("admin partner_qna success");

    	
//        String id = request.getParameter("user_name");
        List<PartnerQnaDTO> partnerQnaList = partnersServiceAdmin.selectAllPartnerQnaList();
        model.addAttribute("partnerQnaList", partnerQnaList);
        
        System.out.println("partnerQnaList size: " + partnerQnaList.size());
        System.out.println("partnerQnaList"+partnerQnaList);
        
        

        
        return "/admin/partner_qna"; 
        }

    
    @GetMapping("/partner_qnaAnswer")
    public String partner_qnaAnswer(@RequestParam("inquiryId") int inquiryId,Model model) {
    	log.info("admin partner_qnaAnswer success");
    	
    	
    	
    	List<PartnerQnaDTO> partnerQna = partnersServiceAdmin.PartnerQnaAnser(inquiryId);
    	
    	model.addAttribute("partnerQna", partnerQna);
//    	 List<PartnerQnaDTO> partnerQnaList = partnersServiceAdmin.selectAllPartnerQnaList();
//        model.addAttribute("partnerQnaList", partnerQnaList);
    	log.info("Fetched partnerQna: {}", partnerQna);

        
        return "/admin/partner_qnaAnswer"; 
        }
    
    
    
    
    @PostMapping("/qnaAnswerOK")
    public String qnaAnswerOK(@RequestParam(value = "answered", defaultValue = "1") int answered,Model model,
    						  @RequestParam("inquiryId") int inquiryId
    						  ) {
    	log.info("admin qnaAnswerOK success");
    	partnersServiceAdmin.qnaAnswerOK(inquiryId,answered);
    	System.out.println("admin answered"+answered);
    	System.out.println("admin inquiryId"+inquiryId);

    	List<PartnerQnaDTO> partnerQnaList = partnersServiceAdmin.selectAllPartnerQnaList();
        model.addAttribute("partnerQnaList", partnerQnaList); //답변상태최신으로업데이트
        
        return "redirect:/admin/partner_qna"; 
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
