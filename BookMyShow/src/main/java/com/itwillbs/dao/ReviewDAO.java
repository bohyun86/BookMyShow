package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.ReviewDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Repository
@Log4j2
@AllArgsConstructor
public class ReviewDAO {

	private final SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwillbs.mapper.ReviewMapper";

	public List<ReviewDTO> getReviewsByMemberId(Integer memberId) {
		return sqlSession.selectList(NAMESPACE + ".getReviewsByMemberId", memberId);
	}

	public ReviewDTO getReviewByPerf(Integer performanceId, Integer userId) {
		Map<String, Object> params = new HashMap<>();
		params.put("performanceId", performanceId);
		params.put("userId", userId);
		return sqlSession.selectOne(NAMESPACE + ".getReviewByPerf", params);
	}

	public ReviewDTO getReviewById(Integer reviewId) {
		return sqlSession.selectOne(NAMESPACE + ".getReviewById", reviewId);
	}

	public void insertReview(ReviewDTO reviewDTO) {
		sqlSession.insert(NAMESPACE + ".insertReview", reviewDTO);
	}

	public void updateReview(ReviewDTO reviewDTO) {
		sqlSession.update(NAMESPACE + ".updateReview", reviewDTO);
	}

	public void deleteReview(int reviewId) {
		sqlSession.delete(NAMESPACE + ".deleteReview", reviewId);
	}

	public PerformanceDTO getPerformanceById(int performanceId) {
		return sqlSession.selectOne(NAMESPACE + ".getPerformanceById", performanceId);
	}
}
