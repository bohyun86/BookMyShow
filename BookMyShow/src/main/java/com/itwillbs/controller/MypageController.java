package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/my/*")
public class MypageController {

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
    public String profileEdit() {
        log.info("profile edit");
        return "/my/profile-edit";
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
