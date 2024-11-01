package com.itwillbs.service;

import com.itwillbs.dao.ReviewDAO;
import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.ReviewDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
@Log4j2
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	private ReviewDAO reviewDAO;

	@Override
	public ReviewDTO getReviewByPerf(Integer performanceId, Integer memberId) {
		return reviewDAO.getReviewByPerf(performanceId, memberId);
	}

	@Override
	public ReviewDTO getReviewById(Integer reviewId) {
		return reviewDAO.getReviewById(reviewId);
	}

	@Override
	public void createReview(ReviewDTO reviewDTO) {
		reviewDAO.insertReview(reviewDTO);
	}

	@Override
	public void updateReview(ReviewDTO reviewDTO) {
		reviewDAO.updateReview(reviewDTO);
	}

	@Override
	public void deleteReview(int reviewId) {
		reviewDAO.deleteReview(reviewId);
	}

	@Override
	public PerformanceDTO getPerformanceById(int performanceId) {
		return reviewDAO.getPerformanceById(performanceId);
	}

	@Override
	public List<ReviewDTO> getReviewsByMemberId(Integer memberId, int page, int size) {
		return reviewDAO.getReviewsByMemberId(memberId, page * size, size);
	}

	@Override
	public int getTotalReviewsCount(Integer memberId) {
		return reviewDAO.getTotalReviewsCount(memberId);
	}
	
	@Override
	public Map<String, Object> getReviewSummary(Integer memberId) {
	    return reviewDAO.getReviewSummary(memberId);
	}
}
