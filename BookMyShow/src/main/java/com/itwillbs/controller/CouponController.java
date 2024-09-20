package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/admin/*")
public class CouponController {

//  @Autowired
//  private CouponService couponService;

	@GetMapping("/coupon-create")
	public String couponCreate() {
		log.info("couponCreate ");
		return "/admin/coupon-create";
	}

	@GetMapping("/coupon-manage")
	public String couponManage() {
		log.info("couponManage ");
		return "/admin/coupon-manage";
	}

}