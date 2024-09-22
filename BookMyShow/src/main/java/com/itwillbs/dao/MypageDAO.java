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
import com.itwillbs.domain.VenueDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Repository
@Log4j2
@AllArgsConstructor
public class MypageDAO {

	private final SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwillbs.mapper.MypageMapper";

	// 단수형 메서드
    public Integer getMemberId(int userId) {
        return sqlSession.selectOne(NAMESPACE + ".getMemberId", userId);
    }

    public UserDTO getUser(Integer userId) {
        return sqlSession.selectOne(NAMESPACE + ".getUser", userId);
    }

    public BookingDTO getBooking(Integer bookingId, Integer memberId) {
        Map<String, Object> params = new HashMap<>();
        params.put("bookingId", bookingId);
        params.put("memberId", memberId);
        return sqlSession.selectOne(NAMESPACE + ".getBooking", params);
    }

    public MusicalDTO getMusical(Integer bookingId) {
        return sqlSession.selectOne(NAMESPACE + ".getMusical", bookingId);
    }

    public AttachFileDTO getAttachFile(Integer bookingId) {
        return sqlSession.selectOne(NAMESPACE + ".getAttachFile", bookingId);
    }

    public PerformanceDTO getPerformance(Integer bookingId) {
        return sqlSession.selectOne(NAMESPACE + ".getPerformance", bookingId);
    }

    public PaymentDTO getPayment(Integer bookingId) {
        return sqlSession.selectOne(NAMESPACE + ".getPayment", bookingId);
    }

    public List<BookedSeatsDTO> getBookedSeats(Integer bookingId) {
        return sqlSession.selectList(NAMESPACE + ".getBookedSeats", bookingId);
    }

    public VenueDTO getVenue(Integer bookingId) {
        return sqlSession.selectOne(NAMESPACE + ".getVenue", bookingId);
    }

    public int getTotalBookingsCount(Integer memberId) {
        return sqlSession.selectOne(NAMESPACE + ".getTotalBookingsCount", memberId);
    }

    public int getTotalRefundsCount(Integer memberId) {
        return sqlSession.selectOne(NAMESPACE + ".getTotalRefundsCount", memberId);
    }

    public boolean processRefund(Integer bookingId, Integer userId) {
        Map<String, Object> params = new HashMap<>();
        params.put("bookingId", bookingId);
        params.put("userId", userId);
        int updatedRows = sqlSession.update(NAMESPACE + ".processRefund", params);
        return updatedRows > 0;
    }

    public int getUsableTicketCount(Integer memberId) {
        return sqlSession.selectOne(NAMESPACE + ".getUsableTicketCount", memberId);
    }

    // 복수형 메서드
    public List<BookingDTO> getBookings(Integer memberId, Integer offset, Integer limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("memberId", memberId);
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

    public List<BookedSeatsDTO> getBookedSeatss(List<Integer> bookingIds) {
        return sqlSession.selectList(NAMESPACE + ".getBookedSeatss", bookingIds);
    }

    public List<VenueDTO> getVenues(List<Integer> bookingIds) {
        return sqlSession.selectList(NAMESPACE + ".getVenues", bookingIds);
    }

    public List<BookingDTO> getRefundBookings(Integer memberId, Integer offset, Integer limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("memberId", memberId);
        params.put("offset", offset);
        params.put("limit", limit);
        return sqlSession.selectList(NAMESPACE + ".getRefundBookings", params);
    }
}
