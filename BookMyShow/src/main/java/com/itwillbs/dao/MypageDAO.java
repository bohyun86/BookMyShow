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

	public Integer getMemberId(int userId) {
	    Integer memberId = sqlSession.selectOne(NAMESPACE + ".getMemberId", userId);
	    return memberId;
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

	public List<BookingDTO> getRefundBookings(Integer memberId, Integer offset, Integer limit) {
		Map<String, Object> params = new HashMap<>();
		params.put("memberId", memberId);
		params.put("offset", offset);
		params.put("limit", limit);
		return sqlSession.selectList(NAMESPACE + ".getRefundBookings", params);
	}

	public int getTotalRefundsCount(Integer memberId) {
		return sqlSession.selectOne(NAMESPACE + ".getTotalRefundsCount", memberId);
	}

	public boolean processRefund(Integer bookingId, Integer userId) {
		// 환불 처리 로직 구현
		// SQL 쿼리를 통해 데이터베이스 업데이트
		int updatedRows = sqlSession.update(NAMESPACE + ".processRefund",
				Map.of("bookingId", bookingId, "userId", userId));
		return updatedRows > 0;
	}

	public int getUserPoint(Integer userId) {
	    Integer balance = sqlSession.selectOne(NAMESPACE + ".getUserPoint", userId);
	    return balance != null ? balance : 0;
	}

	public int getUsableTicketCount(Integer userId) {
		return sqlSession.selectOne(NAMESPACE + ".getUsableTicketCount", userId);
	}
}
