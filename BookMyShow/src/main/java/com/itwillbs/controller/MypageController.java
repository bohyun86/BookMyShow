package com.itwillbs.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserServiceImpl;

@Controller
@Log4j2
@RequestMapping("/my/*")
@AllArgsConstructor
public class MypageController {

	private com.itwillbs.service.MypageServiceImpl MypageServiceImpl;
	private UserServiceImpl userServiceImpl;

	@GetMapping("/bookings")
	public String bookings() {
		log.info("bookings list");
		return "/my/bookings";
	}

	@GetMapping("/booking-detail/{bookingId}")
	public String bookingDetail() {
		log.info("booking detail");
		return "/my/booking-detail";
	}

	@GetMapping("/booking-complete/{bookingId}")
	public String bookingComplete(@PathVariable Integer bookingId, Model model) {
		log.info("booking complete");
		BookingDTO booking = MypageServiceImpl.getBooking(bookingId);
		MusicalDTO musical = MypageServiceImpl.getMusical(bookingId);
//		AttachFileDTO attachFile = MypageServiceImpl.getAttachFile(bookingId);
		PerformanceDTO performance = MypageServiceImpl.getPerformance(bookingId);
		PaymentDTO payment = MypageServiceImpl.getPayment(bookingId);
		List<BookedSeatsDTO> bookedSeats = MypageServiceImpl.getBookedSeats(bookingId);

		model.addAttribute("booking", booking);
		model.addAttribute("musical", musical);
//		model.addAttribute("attachFile", attachFile);
		model.addAttribute("performance", performance);
		model.addAttribute("payment", payment);
		model.addAttribute("bookedSeats", bookedSeats);

		return "/my/booking-complete";
	}
	
	@GetMapping(value = "/{bookingId}/seats", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BookedSeatsDTO>> getBookedSeats(@PathVariable Integer bookingId) {
	    try {
	        List<BookedSeatsDTO> bookedSeats = MypageServiceImpl.getBookedSeats(bookingId);
	        return ResponseEntity.ok(bookedSeats);
	    } catch (Exception e) {
	        log.error("Error fetching booked seats for booking ID: " + bookingId, e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	    }
	}
	

	@GetMapping("/refund/{bookingId}")
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
	public String profileEditPro(UserDTO userDTO, @RequestParam(required = false) String newPassword) {
		log.info("profileEditPro");
		try {
			if (userServiceImpl.loginPro(userDTO) != null) {
				boolean result = userServiceImpl.updateUser(userDTO, newPassword);
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
	public String withdrawUser(HttpSession session, RedirectAttributes redirectAttributes) {
		String userName = (String) session.getAttribute("userName");
		if (userName != null) {
			try {
				UserDTO userDTO = new UserDTO();
				userDTO.setUserName(userName);
				userServiceImpl.deleteUser(userDTO);
				session.invalidate();
				redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다.");
				return "redirect:/main/main"; // 탈퇴 후 메인 페이지로 리다이렉션
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("error", "회원 탈퇴 중 오류가 발생했습니다: " + e.getMessage());
				return "redirect:/my/profile-edit"; // 오류 발생 시 프로필 수정 페이지로 리다이렉션
			}
		} else {
			redirectAttributes.addFlashAttribute("error", "로그인 정보가 유효하지 않습니다.");
			return "redirect:/my/profile-edit";
		}
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
