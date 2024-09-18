package com.itwillbs.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MypageService;
import com.itwillbs.service.UserService;

@Controller
@Log4j2
@RequestMapping("/my/*")
@AllArgsConstructor
public class MypageController {

	private MypageService mypageService;
	private UserService userService;

	@GetMapping("/bookings")
	public String getBookings(Model model, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size, HttpSession session) {
		addCommonAttributes(model, session);

		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);

		List<BookingDTO> bookings = mypageService.getBookings(memberId, null, page, size);
		List<Integer> bookingIds = bookings.stream().map(BookingDTO::getBookingId).collect(Collectors.toList());

		model.addAttribute("bookings", bookings);
		model.addAttribute("musicals", mypageService.getMusicals(bookingIds));
		model.addAttribute("attachFiles", mypageService.getAttachFiles(bookingIds));
		model.addAttribute("performances", mypageService.getPerformances(bookingIds));
		model.addAttribute("payments", mypageService.getPayments(bookingIds));
		model.addAttribute("bookedSeatsMap", mypageService.getBookedSeats(bookingIds));

		int totalElements = mypageService.getTotalBookingsCount(memberId);
		MyPageDTO pageDTO = new MyPageDTO(page, size, totalElements);
		model.addAttribute("pageDTO", pageDTO);

		return "my/bookings";
	}

	@GetMapping("/booking-complete/{bookingId}")
	public String bookingComplete(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);

		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);

		List<BookingDTO> bookings = mypageService.getBookings(memberId, bookingId, 0, 1);
		BookingDTO booking = bookings.get(0);
		List<Integer> bookingIds = Collections.singletonList(bookingId);

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusicals(bookingIds).get(0));
		model.addAttribute("attachFile", mypageService.getAttachFiles(bookingIds).get(0));
		model.addAttribute("performance", mypageService.getPerformances(bookingIds).get(0));
		model.addAttribute("payment", mypageService.getPayments(bookingIds).get(0));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingIds).get(bookingId));

		return "my/booking-complete";
	}

	@GetMapping("/booking-detail/{bookingId}")
	public String bookingDetail(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);

		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/login";
		}

		Integer memberId = mypageService.getMemberId(userId);

		List<BookingDTO> bookings = mypageService.getBookings(memberId, bookingId, 0, 1);
		if (bookings.isEmpty()) {
			return "redirect:/error";
		}
		BookingDTO booking = bookings.get(0);
		List<Integer> bookingIds = Collections.singletonList(bookingId);

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusicals(bookingIds).get(0));
		model.addAttribute("attachFile", mypageService.getAttachFiles(bookingIds).get(0));
		model.addAttribute("performance", mypageService.getPerformances(bookingIds).get(0));
		model.addAttribute("payment", mypageService.getPayments(bookingIds).get(0));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingIds).get(bookingId));
		model.addAttribute("user", mypageService.getUser(userId));
		model.addAttribute("venue", mypageService.getVenues(bookingIds).get(0));

		return "my/booking-detail";
	}

	@GetMapping("/refund/{bookingId}")
	public String refund(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);

		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/login";
		}

		Integer memberId = mypageService.getMemberId(userId);
		List<BookingDTO> bookings = mypageService.getBookings(memberId, bookingId, 0, 1);

		if (bookings.isEmpty()) {
			return "redirect:/error";
		}

		BookingDTO booking = bookings.get(0);
		List<Integer> bookingIds = Collections.singletonList(bookingId);

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusicals(bookingIds).get(0));
		model.addAttribute("attachFile", mypageService.getAttachFiles(bookingIds).get(0));
		model.addAttribute("performance", mypageService.getPerformances(bookingIds).get(0));
		model.addAttribute("payment", mypageService.getPayments(bookingIds).get(0));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingIds).get(bookingId));
		model.addAttribute("user", mypageService.getUser(userId));
		model.addAttribute("venue", mypageService.getVenues(bookingIds).get(0));

		return "my/refund";
	}

	@GetMapping("/refunds")
	public String getRefunds(Model model, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size, HttpSession session) {
		addCommonAttributes(model, session);

		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);
		List<BookingDTO> refunds = mypageService.getRefundBookings(memberId, page, size);
		List<Integer> bookingIds = refunds.stream().map(BookingDTO::getBookingId).collect(Collectors.toList());

		model.addAttribute("refunds", refunds);
		model.addAttribute("musicals", mypageService.getMusicals(bookingIds));
		model.addAttribute("attachFiles", mypageService.getAttachFiles(bookingIds));
		model.addAttribute("performances", mypageService.getPerformances(bookingIds));
		model.addAttribute("payments", mypageService.getPayments(bookingIds));

		int totalElements = mypageService.getTotalRefundsCount(memberId);
		MyPageDTO pageDTO = new MyPageDTO(page, size, totalElements);
		model.addAttribute("pageDTO", pageDTO);

		return "my/refunds";
	}

	@GetMapping("/refund-detail/{bookingId}")
	public String refundDetail(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/login";
		}

		Integer memberId = mypageService.getMemberId(userId);
		List<BookingDTO> bookings = mypageService.getBookings(memberId, bookingId, 0, 1);
		BookingDTO booking = bookings.get(0);
		List<Integer> bookingIds = Collections.singletonList(bookingId);

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusicals(bookingIds).get(0));
		model.addAttribute("attachFile", mypageService.getAttachFiles(bookingIds).get(0));
		model.addAttribute("performance", mypageService.getPerformances(bookingIds).get(0));
		model.addAttribute("payment", mypageService.getPayments(bookingIds).get(0));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingIds).get(bookingId));
		model.addAttribute("user", mypageService.getUser(userId));
		model.addAttribute("venue", mypageService.getVenues(bookingIds).get(0));

		return "/my/refund-detail";
	}

	@GetMapping("/refund-complete/{bookingId}")
	public String refundComplete(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);
		List<BookingDTO> bookings = mypageService.getBookings(memberId, bookingId, 0, 1);

		BookingDTO booking = bookings.get(0);
		List<Integer> bookingIds = Collections.singletonList(bookingId);

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusicals(bookingIds).get(0));
		model.addAttribute("attachFile", mypageService.getAttachFiles(bookingIds).get(0));
		model.addAttribute("performance", mypageService.getPerformances(bookingIds).get(0));
		model.addAttribute("payment", mypageService.getPayments(bookingIds).get(0));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingIds).get(bookingId));
		model.addAttribute("user", mypageService.getUser(userId));

		return "my/refund-complete";
	}

	@GetMapping("/profile-edit")
	public String profileEdit(HttpSession session, Model model) {
		addCommonAttributes(model, session);
		log.info("profile edit");
		String userName = (String) session.getAttribute("userName");
		UserDTO userDTO = new UserDTO();
		userDTO.setUserName(userName);
		userDTO = userService.getUser(userDTO);
		model.addAttribute("userDTO", userDTO);
		return "/my/profile-edit";
	}

	@PostMapping("/profile-editPro")
	public String profileEditPro(UserDTO userDTO, @RequestParam(required = false) String newPassword, Model model,
			HttpSession session) {
		addCommonAttributes(model, session);
		log.info("profileEditPro");
		try {
			if (userService.loginPro(userDTO) != null) {
				boolean result = userService.updateUser(userDTO, newPassword);
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
	public String withdrawal(Model model, HttpSession session) {
		addCommonAttributes(model, session);
		log.info("withdrawal");
		return "/my/withdrawal";
	}

	@PostMapping("/withdraw")
	public String withdrawUser(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		addCommonAttributes(model, session);
		String userName = (String) session.getAttribute("userName");
		if (userName != null) {
			try {
				UserDTO userDTO = new UserDTO();
				userDTO.setUserName(userName);
				userService.deleteUser(userDTO);
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

	private void addCommonAttributes(Model model, HttpSession session) {
//		Integer userId = (Integer) session.getAttribute("userId");
//		if (userId != null) {
//			Integer point = mypageService.getUserPoint(userId);
//			Integer usableTicketCount = mypageService.getUsableTicketCount(userId);
//
//			model.addAttribute("point", point != null ? point : (int) 0);
//			model.addAttribute("usableTicketCount", usableTicketCount != null ? usableTicketCount : (int) 0);
//		}
	}

	@GetMapping("/reviews")
	public String reviews(Model model, HttpSession session) {
		addCommonAttributes(model, session);
		log.info("reviews list");
		return "/my/reviews";
	}

	@GetMapping("/review-write/{bookingId}")
	public String reviewWrite(Model model, HttpSession session) {
		addCommonAttributes(model, session);
		log.info("review write");
		return "/my/review-write";
	}

	@GetMapping("/review-edit/{bookingId}")
	public String reviewEdit(Model model, HttpSession session) {
		addCommonAttributes(model, session);
		log.info("review edit");
		return "/my/review-edit";
	}

	@GetMapping("/review-delete")
	public String reviewDelete(Model model, HttpSession session) {
		addCommonAttributes(model, session);
		log.info("review delete");
		return "/my/review-delete";
	}

	@GetMapping("/points")
	public String points(Model model, HttpSession session) {
		addCommonAttributes(model, session);
		log.info("points check");
		return "/my/points";
	}

	@GetMapping("/coupon-redeem")
	public String couponRedeem(Model model, HttpSession session) {
		addCommonAttributes(model, session);
		log.info("coupon redeem");
		return "/my/coupon-redeem";
	}
}
