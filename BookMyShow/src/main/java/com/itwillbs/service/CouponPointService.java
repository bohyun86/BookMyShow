package com.itwillbs.service;

import org.springframework.data.domain.Page;

import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.PointDTO;

public interface CouponPointService {
	Page<PointDTO> getPointHistory(Integer userId, int page, int size);

	int getTotalPoints(Integer userId);

	int redeemCoupon(Integer userId, String couponCode);

	void createCoupon(CouponDTO couponDTO);

	Page<CouponDTO> getAllCoupons(int page, int size);

	boolean deleteCoupon(Integer couponId);
}
