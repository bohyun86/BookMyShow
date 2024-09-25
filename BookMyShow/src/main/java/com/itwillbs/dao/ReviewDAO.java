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

	public ReviewDTO getReviewByPerf(Integer performanceId, Integer memberId) {
		Map<String, Object> params = new HashMap<>();
		params.put("performanceId", performanceId);
		params.put("memberId", memberId);
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

	public List<ReviewDTO> getReviewsByMemberId(Integer memberId, Integer offset, Integer limit) {
		Map<String, Object> params = new HashMap<>();
		params.put("memberId", memberId);
		params.put("offset", offset);
		params.put("limit", limit);
		return sqlSession.selectList(NAMESPACE + ".getReviewsByMemberId", params);
	}

	public int getTotalReviewsCount(Integer memberId) {
		return sqlSession.selectOne(NAMESPACE + ".getTotalReviewsCount", memberId);
	}
	
	public Map<String, Object> getReviewSummary(Integer memberId) {
	    return sqlSession.selectOne(NAMESPACE + ".getReviewSummary", memberId);
	}
}
