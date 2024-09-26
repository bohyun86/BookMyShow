package com.itwillbs.controller;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.itwillbs.domain.Performance.MusicalDTO;

import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.PartnerDTO2;
import com.itwillbs.domain.PartnerQnaDTO;

import com.itwillbs.domain.CouponDTO;
//import com.itwillbs.domain.Performance.MusicalDTO;
import com.itwillbs.domain.MyPageDTO;

import com.itwillbs.domain.Performance.AttachFile2DTO;
import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.PerformanceTempDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.UserDTOAdmin;
import com.itwillbs.domain.partner.PartnerStatusDTO;
import com.itwillbs.service.*;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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

	private CouponPointService couponPointService;
	private PartnersServiceAdmin partnersServiceAdmin;
	private UserServiceImpl userServiceImpl;
	private MusicalService musicalService;
	private AdminService adminService;
	private PartnerService partnerService;
	private PartnerController partnerController;
	private ServletContext servletContext;
	private ObjectMapper objectMapper;
	private MemberService memberService;
	

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

		return "redirect:/main/main";
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
            List<com.itwillbs.domain.Performance.MusicalDTO> musicalList = musicalService.getMusicalByPartnerId(findKeyword);
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
            com.itwillbs.domain.Performance.MusicalDTO musicalDTO = musicalService.getMusicalByTitle(findKeyword);
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
//	return"/admin/submit";
    
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
		MusicalDTO musicalDTO = partnerService.getMusicalByMusicalId(musicalId);
		boolean musicalApproved = musicalDTO.isApproved();

		log.info("Approved: {}", musicalApproved);

        log.info("attachFileDTO: {}", attachFileDTO);

        model.addAttribute("performanceTempDTO", performanceTempDTO);
        model.addAttribute("attachFileDTO", attachFileDTO);
		model.addAttribute("approval", musicalApproved);
        return"/admin/editPro";
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
	public String partner_submit(Model model) {
		log.info("admin partner_submit success");
		
		 List<PartnerDTO2> partnerList = partnersServiceAdmin.partnersumbitList(); //파트너리스트 파트너회원가입 구현하면 이거주석 하고 테스트
//		 List<UserDTOAdmin> partnerList = partnersServiceAdmin.partnersumbitList(); //파트너리스트
	        model.addAttribute("partnerList", partnerList);
	        
	        System.out.println("partnerQnaList size: " + partnerList.size());
	        System.out.println("partnerQnaList"+partnerList);
	        
		
		
		
		
		return "/admin/partner_submit";
	}

	@GetMapping("/partner_sumbitPro")
	public String partner_sumbitPro(@RequestParam("partner_id") int partner_id,Model model) {
		log.info("admin partner_submitPro success");
		
		model.addAttribute("partner_id", partner_id);
		List<PartnerDTO2> partnerDTO2=partnersServiceAdmin.partnersumbitConfirm(partner_id);
		
		model.addAttribute("partnerDTO2", partnerDTO2);
		System.out.println(partnerDTO2);
		
//		partnersServiceAdmin.partnerConfirm(partner_id);
		
		
		
		return "/admin/partner_sumbitPro";
	}
	
	
	
	
	
	@PostMapping("/partner_submitConfirm")
	public String partner_submitConfirm(@RequestParam(required = false)Integer partner_id,Model model) {
		System.out.println("partner_id"+partner_id);
		log.info("admin partner_submitConfirm success");
		
		
		
		
		
//		List<PartnerDTO2> partnerDTO2=partnersServiceAdmin.partnersumbitConfirm(partner_id);
//		
//		model.addAttribute("partner_id", partner_id);
//		System.out.println(partnerDTO2);
		
		
//		
		partnersServiceAdmin.partnerConfirm(partner_id);
		
//		 List<UserDTOAdmin> partnerList = partnersServiceAdmin.partnersumbitList();

		 List<PartnerDTO2> partnerList = partnersServiceAdmin.partnersumbitList();
		model.addAttribute("partnerList", partnerList);
//		System.out.println(partnerList);
//		
		
		
		return "redirect:/admin/partner_submit"; 
	}//승인요청 수락
	
	
	
	
	@PostMapping("/partner_delete")
	public String partner_delete(@RequestParam("partner_id") int partner_id) {
		log.info("admin partner_submitConfirm success");
		
		partnersServiceAdmin.partner_delete(partner_id);
		
		return "redirect:/admin/partner_submit";
	}
	
	
	
	

	
	@GetMapping("/partnerPro")
	public String partnerPro(@RequestParam("user_name") String user_name, 
			@RequestParam("password") String password,
			@RequestParam("name") String name, 
			@RequestParam("company_name") String  company_name,
			@RequestParam("business_id") String business_id,
			@RequestParam("account_number") String account_number,
			@RequestParam("bank_name") String bank_name,
			@RequestParam("phone_number") String phone_number,
			@RequestParam("email") String email, 
			@RequestParam("created_at") String created_at,
			@RequestParam(required = false)Integer partner_id,
			Model model) {
		log.info("admin partnerPro success");

		model.addAttribute("userName", user_name);
		model.addAttribute("password", password);
		model.addAttribute("name", name);
		model.addAttribute("companyName", company_name);
		model.addAttribute("businessId", business_id);
		model.addAttribute("accountNumber", account_number);
		model.addAttribute("bankName", bank_name);
		model.addAttribute("phoneNumber", phone_number);
		model.addAttribute("email", email);
		model.addAttribute("createdAt", created_at);
		model.addAttribute("partner_id", partner_id);

		return "/admin/partnerPro";
	} // parter에서 ajax에서 가져온 값을 admincontroller로 넘겨서 partnerPro로 넘기는 과정


//	@PostMapping("/editPartnerForm")
//	public String editPartnerForm(@RequestParam(required = false)Integer partner_id,
//			@RequestParam(required = false)Integer user_id,
//			@RequestParam("user_name") String user_name
//						) {
//		log.info("admin editPartnerForm success");
//		System.out.println("editPartner"+partner_id);
//		System.out.println("editPartner"+user_id);
//		System.out.println("editPartner"+user_name);
//		
//		
//		return "redirect:/admin/partner";
//	}
//	
	
	
	
	
	
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
    public String partner_qnaAnswer(@RequestParam("inquiry_id") int inquiry_id,
    								@RequestParam(required = false) String answer_content,Model model) {
    	log.info("admin partner_qnaAnswer success");
    	
    	
    	
//    	List<PartnerQnaDTO> partnerQna = partnersServiceAdmin.PartnerQnaAnser(inquiryId);
    	List<PartnerQnaDTO> partnerQna = partnersServiceAdmin.PartnerQnaAnser(inquiry_id,answer_content);
    	
    	model.addAttribute("partnerQna", partnerQna);
//    	 List<PartnerQnaDTO> partnerQnaList = partnersServiceAdmin.selectAllPartnerQnaList();
//        model.addAttribute("partnerQnaList", partnerQnaList);
    	log.info("Fetched partnerQna: {}", partnerQna);

        
        return "/admin/partner_qnaAnswer"; 
        }
    
    
    
    //답변하고 리스트 화면 돌아가기
    @PostMapping("/qnaAnswerOK")
    public String qnaAnswerOK(Model model,
    						  @RequestParam("inquiryId") int inquiryId,
    						  @RequestParam("answerContent") String answerContent
    						  ) {
    	log.info("admin qnaAnswerOK success");
    	partnersServiceAdmin.qnaAnswerOK(inquiryId);
    	partnersServiceAdmin.qnaAnswerContentOK(answerContent,inquiryId);  
//    	System.out.println("admin answered"+answered);

//    	List<PartnerQnaDTO> partnerQnaList = partnersServiceAdmin.qnaAnswerOK(inquiryId);
    	System.out.println("admin inquiryId"+inquiryId);
    	System.out.println("admin answerContent"+answerContent);
    	List<PartnerQnaDTO> partnerQnaList = partnersServiceAdmin.selectAllPartnerQnaList();
        model.addAttribute("partnerQnaList", partnerQnaList); //답변상태최신으로업데이트
        
        return "redirect:/admin/partner_qna"; 
        }
    ////////수정필요할듯
    
    


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

//	
	
	@GetMapping("/memberPro")
	public String memberPro(@RequestParam("user_name") String user_name, 
			@RequestParam("name") String name, 
			@RequestParam("password") String password, 
			@RequestParam("phone_number") String phone_number,
			@RequestParam("email") String email, 
			@RequestParam("created_at") String created_at,
			Model model) {
		log.info("admin memberPro success");
		
		model.addAttribute("userName", user_name);
		model.addAttribute("password", password);
		model.addAttribute("name", name);
		model.addAttribute("phoneNumber", phone_number);
		model.addAttribute("email", email);
		model.addAttribute("createdAt", created_at);
//		
		
		
		
		
		return "/admin/memberPro";
	}
	
	
	@GetMapping("/member_qna")
	public String member_qna(Model model) {
		
		log.info("admin member_qna success");
		  List<UserDTOAdmin> memberQnaList = partnersServiceAdmin.memberQnaList();
	        model.addAttribute("memberQnaList", memberQnaList);
	        
	        
	        System.out.println("memberQnaList size: " + memberQnaList.size());
	        System.out.println("memberQnaList"+memberQnaList);
		
				
		
		
		return "/admin/member_qna";
	}
	
    

    
	
	
	@GetMapping("/member_qnaAnswer")
    public String member_qnaAnswer(@RequestParam("inquiry_id") int inquiry_id,
    								@RequestParam(required = false) String answer_content,Model model) {
    	log.info("admin member_qnaAnswer success");
    	
    	
    	
    	List<UserDTOAdmin> memberQna = partnersServiceAdmin.memberQnaAnser(inquiry_id,answer_content);
    	
    	model.addAttribute("memberQna", memberQna);
//    	 List<PartnerQnaDTO> partnerQnaList = partnersServiceAdmin.selectAllPartnerQnaList();
//        model.addAttribute("partnerQnaList", partnerQnaList);
    	log.info("Fetched memberQna: {}", memberQna);
    	System.out.println("member_qnaAnswer"+inquiry_id);
        
        return "/admin/member_qnaAnswer"; 
        }
	
	

    @PostMapping("/memberqnaAnswerOK")
    public String memberqnaAnswerOK(Model model,
    						  @RequestParam("inquiryId") int inquiryId,
    						  @RequestParam("answerContent") String answerContent
    						  ) {
    	log.info("admin qnaAnswerOK success");
    	partnersServiceAdmin.qnaAnswerOK(inquiryId); // 완료처리
    	partnersServiceAdmin.qnaAnswerContentOK(answerContent,inquiryId);  
    	System.out.println("admin inquiryId"+inquiryId);
    	System.out.println("admin answerContent"+answerContent);
    	
    	  List<UserDTOAdmin> memberQnaList = partnersServiceAdmin.memberQnaList();
        model.addAttribute("memberQnaList", memberQnaList); //답변상태최신으로업데이트
        
        return "redirect:/admin/member_qna"; 
        }
    ////////수정필요할듯

	
	@GetMapping("/booking")
	public String booking(
			@RequestParam(required = false) int user_id,
//			 @RequestParam("booking_id") int booking_id,
			Model model
			) {
		log.info("admin booking success");
System.out.println("booking user_id"+user_id);
//model.addAttribute("booking_id",booking_id);
List<UserDTOAdmin> memberBooked = memberService.memberBooked(user_id); //예매내역
System.out.println("booking user_id"+user_id);
model.addAttribute("memberBooked",memberBooked);
System.out.println("booking memberBooked----"+memberBooked);

		return "/admin/booking";
	} // member에서 ajax에서 가져온 값을 admincontroller로 넘겨서 booking로 넘기는 과정

	


	@GetMapping("/payment")
	public String payment(@RequestParam(required = false) int user_id,Model model) {
		log.info("admin payment success");
		System.out.println("booking user_id"+user_id);
		List<UserDTOAdmin> memberpay = memberService.memberpay(user_id); // 결제내역
		model.addAttribute("memberpay", memberpay);
		System.out.println("memberpay----"+memberpay);
		
		
		return "/admin/payment";
	}// member에서 ajax에서 가져온 값을 admincontroller로 넘겨서 payment로 넘기는 과정
	
	
	

	@GetMapping("/support")
	public String support() {
		log.info("admin support success");
		return "/admin/support";
	}

	// coupon start
	@GetMapping("/coupon-create")
	public String couponCreateForm() {
		return "admin/coupon-create";
	}

	@PostMapping("/create-coupon")
	@ResponseBody
	public ResponseEntity<String> createCoupon(@RequestParam String coupon1, @RequestParam String coupon2,
			@RequestParam String coupon3, @RequestParam Integer couponAmount) {
		String couponCode = coupon1 + coupon2 + coupon3;
		CouponDTO couponDTO = new CouponDTO();
		couponDTO.setCode(couponCode);
		couponDTO.setCouponAmount(couponAmount);
		try {
			couponPointService.createCoupon(couponDTO);
			return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8)
					.body("{\"success\": true, \"message\": \"쿠폰이 성공적으로 생성되었습니다.\"}");
		} catch (Exception e) {
			return ResponseEntity.badRequest().contentType(MediaType.APPLICATION_JSON_UTF8)
					.body("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
		}
	}

	@GetMapping("/coupon-manage")
	public String couponManage(Model model, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size) {
		Page<CouponDTO> coupons = couponPointService.getAllCoupons(page, size);
		model.addAttribute("coupons", coupons.getContent());
		model.addAttribute("pageInfo", new MyPageDTO(page, size, coupons.getTotalElements()));
		return "admin/coupon-manage";
	}

	@PostMapping("/delete-coupon")
	@ResponseBody
	public ResponseEntity<?> deleteCoupon(@RequestParam Integer couponId) {
		boolean deleted = couponPointService.deleteCoupon(couponId);
		if (deleted) {
			return ResponseEntity.ok().body("{\"success\": true}");
		} else {
			return ResponseEntity.badRequest().body("{\"success\": false}");
		}
	}
	// coupon end

}//
