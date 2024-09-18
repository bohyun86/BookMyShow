package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.Performance.VenueDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Repository
@Log4j2
@AllArgsConstructor
public class MypageDAO {

	private final SqlSession sqlSession;

	private static final String NAMESPACE = "com.itwillbs.mapper.MypageMapper";

	public Integer getMemberId(Integer userId) {
		return sqlSession.selectOne(NAMESPACE + ".getMemberId", userId);
	}

	public UserDTO getUser(Integer userId) {
		return sqlSession.selectOne(NAMESPACE + ".getUser", userId);
	}

	public List<BookingDTO> getBookings(Integer memberId, Integer bookingId, Integer offset, Integer limit) {
		Map<String, Object> params = new HashMap<>();
		params.put("memberId", memberId);
		params.put("bookingId", bookingId);
		params.put("offset", offset);
		params.put("limit", limit);
		return sqlSession.selectList(NAMESPACE + ".getBookings", params);
	}

	public List<MusicalDTO> getMusicals(List<Integer> bookingIds) {
		return sqlSession.selectList(NAMESPACE + ".getMusicals", bookingIds);
	}

	public List<AttachFileDTO> getAttachFiles(List<Integer> bookingIds) {
		return sqlSession.selectList(NAMESPACE + ".getAttachFiles", bookingIds);
	}

	public List<PerformanceDTO> getPerformances(List<Integer> bookingIds) {
		return sqlSession.selectList(NAMESPACE + ".getPerformances", bookingIds);
	}

	public List<PaymentDTO> getPayments(List<Integer> bookingIds) {
		return sqlSession.selectList(NAMESPACE + ".getPayments", bookingIds);
	}

	public List<BookedSeatsDTO> getBookedSeats(List<Integer> bookingIds) {
		return sqlSession.selectList(NAMESPACE + ".getBookedSeats", bookingIds);
	}
	
	public List<VenueDTO> getVenues(List<Integer> bookingIds) {
	    return sqlSession.selectList(NAMESPACE + ".getVenues", bookingIds);
	}

	public int getTotalBookingsCount(Integer memberId) {
		return sqlSession.selectOne(NAMESPACE + ".getTotalBookingsCount", memberId);
	}
}
