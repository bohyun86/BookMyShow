package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.ReviewDTO;

public interface ReviewService {

	ReviewDTO getReviewByPerf(Integer performanceId, Integer memberId);

	ReviewDTO getReviewById(Integer reviewId);

	void createReview(ReviewDTO reviewDTO);

	void updateReview(ReviewDTO reviewDTO);

	void deleteReview(int reviewId);

	PerformanceDTO getPerformanceById(int performanceId);

	List<ReviewDTO> getReviewsByMemberId(Integer memberId, int page, int size);

	int getTotalReviewsCount(Integer memberId);
	
	Map<String, Object> getReviewSummary(Integer memberId);
}
