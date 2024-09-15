package com.itwillbs.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserServiceImpl;

@Controller
@Log4j2
@RequestMapping("/my/*")
@AllArgsConstructor
public class MypageController {

	private UserServiceImpl userServiceImpl;

	@GetMapping("/bookings")
	public String bookings() {
		log.info("bookings list");
		return "/my/bookings";
	}

	@GetMapping("/booking-detail")
	public String bookingDetail() {
		log.info("booking detail");
		return "/my/booking-detail";
	}

	@GetMapping("/booking-complete")
	public String bookingComplete() {
		log.info("booking complete");
		return "/my/booking-complete";
	}

	@GetMapping("/refund")
	public String refund() {
		log.info("refund");
		return "/my/refund";
	}

	@GetMapping("/refund-complete")
	public String refundComplete() {
		log.info("refund complete");
		return "/my/refund-complete";
	}

	@GetMapping("/refunds")
	public String refunds() {
		log.info("refunds list");
		return "/my/refunds";
	}

	@GetMapping("/refund-detail")
	public String refundDetail() {
		log.info("refund detail");
		return "/my/refund-detail";
	}

	@GetMapping("/profile-edit")
	public String profileEdit(HttpSession session, Model model) {
	    log.info("profile edit");
	    String userName = (String) session.getAttribute("userName");
	    UserDTO userDTO = new UserDTO();
	    userDTO.setUserName(userName);
	    userDTO = userServiceImpl.getUser(userDTO);
	    model.addAttribute("userDTO", userDTO);
	    return "/my/profile-edit";
	}

	@PostMapping("/profile-editPro")
	public String profileEditPro(UserDTO userDTO,  @RequestParam(required = false) String newPassword) {
		log.info("profileEditPro");
		try {
			UserDTO dbUserDTO = userServiceImpl.loginPro(userDTO);
			if (dbUserDTO != null) {
				boolean result = userServiceImpl.updateUser(dbUserDTO, newPassword);
				log.info("프로필 업데이트 결과: {}", result ? "성공" : "실패");
			} else {
				log.warn("사용자 인증 실패: {}", userDTO.getUserId());
			}
		} catch (Exception e) {
			log.error("프로필 업데이트 중 오류 발생", e);
		}
		return "redirect:/my/bookings";
	}

	@GetMapping("/withdrawal")
	public String withdrawal() {
		log.info("withdrawal");
		return "/my/withdrawal";
	}

	@PostMapping("/withdraw")
	public String withdraw() {
		log.info("withdraw");
		return "redirect:../main";
	}

	@GetMapping("/reviews")
	public String reviews() {
		log.info("reviews list");
		return "/my/reviews";
	}

	@GetMapping("/review-write")
	public String reviewWrite() {
		log.info("review write");
		return "/my/review-write";
	}

	@GetMapping("/review-edit")
	public String reviewEdit() {
		log.info("review edit");
		return "/my/review-edit";
	}

	@GetMapping("/review-delete")
	public String reviewDelete() {
		log.info("review delete");
		return "/my/review-delete";
	}

	@GetMapping("/points")
	public String points() {
		log.info("points check");
		return "/my/points";
	}

	@GetMapping("/coupon-redeem")
	public String couponRedeem() {
		log.info("coupon redeem");
		return "/my/coupon-redeem";
	}
}
