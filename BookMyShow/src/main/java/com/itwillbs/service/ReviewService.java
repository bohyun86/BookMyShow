package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.ReviewDTO;

public interface ReviewService {

	List<ReviewDTO> getReviewsByMemberId(Integer memberId);

	ReviewDTO getReviewByPerf(Integer performanceId, Integer userId);

	ReviewDTO getReviewById(Integer reviewId);

	void createReview(ReviewDTO reviewDTO);

	void updateReview(ReviewDTO reviewDTO);

	void deleteReview(int reviewId);

	PerformanceDTO getPerformanceById(int performanceId);
}
