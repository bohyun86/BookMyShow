package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.PointDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Repository
@Log4j2
@AllArgsConstructor
public class CouponPointDAO {

	private final SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwillbs.mapper.CouponPointMapper";

	public Page<PointDTO> getPointHistory(Integer userId, Pageable pageable) {
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("offset", pageable.getOffset());
		params.put("limit", pageable.getPageSize());
		List<PointDTO> points = sqlSession.selectList(NAMESPACE + ".getPointHistory", params);
		int total = sqlSession.selectOne(NAMESPACE + ".getTotalPointHistoryCount", userId);
		return new PageImpl<>(points, pageable, total);
	}

	public int getTotalPoints(Integer userId) {
		return sqlSession.selectOne(NAMESPACE + ".getTotalPoints", userId);
	}

	public void addPoints(Integer userId, int amount, String type, Integer relatedId) {
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("amount", amount);
		params.put("type", type);
		params.put("relatedId", relatedId);
		sqlSession.insert(NAMESPACE + ".addPoints", params);
	}

	public void insertCoupon(CouponDTO couponDTO) {
		sqlSession.insert(NAMESPACE + ".insertCoupon", couponDTO);
	}

	public List<CouponDTO> getAllCoupons(int offset, int limit) {
		Map<String, Object> params = new HashMap<>();
		params.put("offset", offset);
		params.put("limit", limit);
		return sqlSession.selectList(NAMESPACE + ".getAllCoupons", params);
	}

	public int getTotalCouponsCount() {
		return sqlSession.selectOne(NAMESPACE + ".getTotalCouponsCount");
	}

	public boolean deleteCoupon(Integer couponId) {
		int result = sqlSession.delete(NAMESPACE + ".deleteCoupon", couponId);
		return result > 0;
	}

	public CouponDTO getCouponByCode(String code) {
		return sqlSession.selectOne(NAMESPACE + ".getCouponByCode", code);
	}

	public void updateCouponStatus(String code, String status) {
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("status", status);
		sqlSession.update(NAMESPACE + ".updateCouponStatus", params);
	}
}
