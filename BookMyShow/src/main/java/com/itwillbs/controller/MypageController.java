package com.itwillbs.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.CouponPointService;
import com.itwillbs.service.MypageService;
import com.itwillbs.service.ReviewService;
import com.itwillbs.service.UserService;

@Controller
@Log4j2
@RequestMapping("/my/*")
@AllArgsConstructor
public class MypageController {

	private MypageService mypageService;
	private UserService userService;
	private ReviewService reviewService;
	private CouponPointService couponPointService;

	private void addCommonAttributes(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberID = mypageService.getMemberId(userId);
		if (userId != null) {
			Integer point = couponPointService.getTotalPoints(userId);
			Integer usableTicketCount = mypageService.getUsableTicketCount(memberID);
			model.addAttribute("point", point);
			model.addAttribute("usableTicketCount", usableTicketCount);
		}
	}

	// 복수형 메서드
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
		model.addAttribute("bookedSeatsMap", mypageService.getBookedSeatss(bookingIds));
		int totalElements = mypageService.getTotalBookingsCount(memberId);
		MyPageDTO pageDTO = new MyPageDTO(page, size, totalElements);
		model.addAttribute("pageDTO", pageDTO);

		return "my/bookings";
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

	// 단수형 메서드
	@GetMapping("/booking-detail/{bookingId}")
	public String bookingDetail(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/login";
		}

		Integer memberId = mypageService.getMemberId(userId);
		BookingDTO booking = mypageService.getBooking(bookingId, memberId);
		if (booking == null) {
			return "redirect:/error";
		}

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusical(bookingId));
		model.addAttribute("attachFile", mypageService.getAttachFile(bookingId));
		model.addAttribute("performance", mypageService.getPerformance(bookingId));
		model.addAttribute("payment", mypageService.getPayment(bookingId));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingId));
		model.addAttribute("user", mypageService.getUser(userId));
		model.addAttribute("venue", mypageService.getVenue(bookingId));

		return "my/booking-detail";
	}

	@GetMapping("/refund/{bookingId}")
	public String refund(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);
		BookingDTO booking = mypageService.getBooking(bookingId, memberId);

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusical(bookingId));
		model.addAttribute("attachFile", mypageService.getAttachFile(bookingId));
		model.addAttribute("performance", mypageService.getPerformance(bookingId));
		model.addAttribute("payment", mypageService.getPayment(bookingId));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingId));
		model.addAttribute("user", mypageService.getUser(userId));
		model.addAttribute("venue", mypageService.getVenue(bookingId));

		return "my/refund";
	}
	
	@PostMapping("/refund-process/{bookingId}")
	public String processRefund(@PathVariable Integer bookingId, @RequestParam BigDecimal refundRate, Model model, HttpSession session) {
	    Integer userId = (Integer) session.getAttribute("userId");
	    Integer memberId = mypageService.getMemberId(userId);
	    
	    BookingDTO booking = mypageService.getBooking(bookingId, memberId);
//	    PaymentDTO payment = mypageService.getPayment(bookingId);

//	    BigDecimal refundAmount = new BigDecimal(payment.getPaymentAmount()).multiply(refundRate);
//	    String refundType = getRefundType(refundRate);

//	    boolean refundSuccess = mypageService.processRefund(bookingId, refundType, refundAmount, userId);
	    boolean refundSuccess = mypageService.processRefund(bookingId, "전액환불", new BigDecimal("10.50"), userId);

	    if (refundSuccess) {
	        return "redirect:/my/refund-complete/" + bookingId;
	    } else {
	        return "redirect:/my/refund/" + bookingId + "?error=refund_failed";
	    }
	}

	private String getRefundType(BigDecimal refundRate) {
	    if (refundRate.compareTo(BigDecimal.ONE) == 0) return "전액환불";
	    if (refundRate.compareTo(new BigDecimal("0.9")) == 0) return "90%환불";
	    if (refundRate.compareTo(new BigDecimal("0.8")) == 0) return "80%환불";
	    if (refundRate.compareTo(new BigDecimal("0.7")) == 0) return "70%환불";
	    return "환불불가";
	}

	@GetMapping("/refund-detail/{bookingId}")
	public String refundDetail(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/login";
		}

		Integer memberId = mypageService.getMemberId(userId);
		BookingDTO booking = mypageService.getBooking(bookingId, memberId);
		if (booking == null) {
			return "redirect:/error";
		}

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusical(bookingId));
		model.addAttribute("attachFile", mypageService.getAttachFile(bookingId));
		model.addAttribute("performance", mypageService.getPerformance(bookingId));
		model.addAttribute("payment", mypageService.getPayment(bookingId));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingId));
		model.addAttribute("user", mypageService.getUser(userId));
		model.addAttribute("venue", mypageService.getVenue(bookingId));

		return "my/refund-detail";
	}

	@GetMapping("/booking-complete/{bookingId}")
	public String bookingComplete(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);

		BookingDTO booking = mypageService.getBooking(bookingId, memberId);
		if (booking == null) {
			return "redirect:/error";
		}

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusical(bookingId));
		model.addAttribute("attachFile", mypageService.getAttachFile(bookingId));
		model.addAttribute("performance", mypageService.getPerformance(bookingId));
		model.addAttribute("payment", mypageService.getPayment(bookingId));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingId));

		return "my/booking-complete";
	}

	@GetMapping("/refund-complete/{bookingId}")
	public String refundComplete(@PathVariable Integer bookingId, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);

		BookingDTO booking = mypageService.getBooking(bookingId, memberId);
		if (booking == null) {
			return "redirect:/error";
		}

		model.addAttribute("booking", booking);
		model.addAttribute("musical", mypageService.getMusical(bookingId));
		model.addAttribute("attachFile", mypageService.getAttachFile(bookingId));
		model.addAttribute("performance", mypageService.getPerformance(bookingId));
		model.addAttribute("payment", mypageService.getPayment(bookingId));
		model.addAttribute("bookedSeats", mypageService.getBookedSeats(bookingId));
		model.addAttribute("user", mypageService.getUser(userId));

		return "my/refund-complete";
	}

	// profile
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
		return "redirect:/my/profile-edit";
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

	@GetMapping("/reviews")
	public String reviews(Model model, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);

		List<ReviewDTO> reviews = reviewService.getReviewsByMemberId(memberId, page, size);
		Map<String, Object> summary = reviewService.getReviewSummary(memberId);

		int totalElements = reviewService.getTotalReviewsCount(memberId);
		MyPageDTO pageDTO = new MyPageDTO(page, size, totalElements);

		model.addAttribute("reviews", reviews);
		model.addAttribute("totalReviews", summary.get("totalReviews"));
		model.addAttribute("averageRating", summary.get("averageRating"));
		model.addAttribute("pageDTO", pageDTO);

		return "my/reviews";
	}

	@GetMapping("/review-check/{performanceId}")
	public String reviewCheck(@PathVariable Integer performanceId, Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);

		ReviewDTO existingReview = reviewService.getReviewByPerf(performanceId, memberId);

		if (existingReview != null) {
			return "redirect:/my/review-form/" + existingReview.getReviewId();
		} else {
			return "redirect:/my/review-form/p" + performanceId;
		}
	}

	@GetMapping("/review-form/{id}")
	public String reviewForm(@PathVariable String id, Model model, HttpSession session) {
		addCommonAttributes(model, session);

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		if (id.startsWith("p")) {
			// 리뷰 작성
			Integer performanceId = Integer.parseInt(id.substring(1));
			PerformanceDTO performance = reviewService.getPerformanceById(performanceId);
			model.addAttribute("performance", performance);
			model.addAttribute("isEdit", false);
			model.addAttribute("formattedPerformanceDate", performance.getPerformanceDate().format(formatter));
		} else {
			// 리뷰 수정
			Integer reviewId = Integer.parseInt(id);
			ReviewDTO review = reviewService.getReviewById(reviewId);

			PerformanceDTO performance = reviewService.getPerformanceById(review.getPerformanceId());
			model.addAttribute("review", review);
			model.addAttribute("performance", performance);
			model.addAttribute("isEdit", true);
			model.addAttribute("formattedPerformanceDate", performance.getPerformanceDate().format(formatter));
		}

		return "my/review-form";
	}

	@PostMapping("/review-create")
	public String createReview(@ModelAttribute ReviewDTO reviewDTO, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		Integer memberId = mypageService.getMemberId(userId);
		reviewDTO.setMemberId(memberId);
		reviewService.createReview(reviewDTO);
		return "redirect:/my/reviews";
	}

	@PostMapping("/review-update")
	public String updateReview(@ModelAttribute ReviewDTO reviewDTO, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		reviewService.updateReview(reviewDTO);
		return "redirect:/my/reviews";
	}

	@PostMapping("/review-delete/{reviewId}")
	public String reviewDelete(@PathVariable int reviewId, Model model, HttpSession session) {
		addCommonAttributes(model, session);
		reviewService.deleteReview(reviewId);
		return "redirect:/my/reviews";
	}

	@GetMapping("/points")
	public String points(Model model, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size, HttpSession session) {
		addCommonAttributes(model, session);
		Integer userId = (Integer) session.getAttribute("userId");
		Page<PointDTO> pointHistory = couponPointService.getPointHistory(userId, page, size);
		model.addAttribute("pointHistory", pointHistory.getContent());
		model.addAttribute("pageInfo", new MyPageDTO(page, size, pointHistory.getTotalElements()));
		model.addAttribute("totalPoints", couponPointService.getTotalPoints(userId));
		return "my/points";
	}

	@GetMapping("/coupon-redeem")
	public String couponRedeemForm(Model model, HttpSession session) {
		addCommonAttributes(model, session);
		return "my/coupon-redeem";
	}

	@PostMapping("/redeem-coupon")
	@ResponseBody
	public ResponseEntity<String> redeemCoupon(@RequestParam String coupon1, @RequestParam String coupon2,
			@RequestParam String coupon3, HttpSession session) {
		String couponCode = coupon1 + coupon2 + coupon3;
		Integer userId = (Integer) session.getAttribute("userId");
		try {
			int pointsAdded = couponPointService.redeemCoupon(userId, couponCode);
			String jsonResponse = String.format("{\"message\": \"%d 포인트가 추가되었습니다.\", \"redirect\": \"/my/points\"}",
					pointsAdded);
			return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8).body(jsonResponse);
		} catch (Exception e) {
			return ResponseEntity.badRequest().contentType(MediaType.APPLICATION_JSON_UTF8)
					.body("{\"error\": \"" + e.getMessage() + "\"}");
		}
	}

}
