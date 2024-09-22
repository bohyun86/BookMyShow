package com.itwillbs.service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.CouponPointDAO;
import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.PointDTO;

@Service
@Log4j2
@AllArgsConstructor
public class CouponPointServiceImpl implements CouponPointService {

	private CouponPointDAO couponPointDAO;

	@Override
	public Page<PointDTO> getPointHistory(Integer userId, int page, int size) {
		return couponPointDAO.getPointHistory(userId, PageRequest.of(page, size));
	}

	@Override
	public int getTotalPoints(Integer userId) {
		return couponPointDAO.getTotalPoints(userId);
	}

	@Override
	@Transactional
	public int redeemCoupon(Integer userId, String couponCode) {
		CouponDTO coupon = couponPointDAO.getCouponByCode(couponCode);
		if (coupon == null || !"Active".equals(coupon.getStatus())) {
			throw new IllegalArgumentException("유효하지 않은 쿠폰입니다.");
		}
		int pointsToAdd = coupon.getCouponAmount();
		couponPointDAO.addPoints(userId, pointsToAdd, "쿠폰전환", coupon.getCouponId());
		couponPointDAO.updateCouponStatus(couponCode, "Used");
		return pointsToAdd;
	}

	@Override
	public void createCoupon(CouponDTO couponDTO) {
		if (couponDTO.getCode().length() != 12) {
			throw new IllegalArgumentException("쿠폰 코드는 12자리여야 합니다.");
		}
		couponPointDAO.insertCoupon(couponDTO);
	}
	
	@Override
	public Page<CouponDTO> getAllCoupons(int page, int size) {
		int totalCoupons = couponPointDAO.getTotalCouponsCount();
		List<CouponDTO> coupons = couponPointDAO.getAllCoupons(page * size, size);
		return new PageImpl<>(coupons, PageRequest.of(page, size), totalCoupons);
	}

	@Override
	public boolean deleteCoupon(Integer couponId) {
		return couponPointDAO.deleteCoupon(couponId);
	}
}
