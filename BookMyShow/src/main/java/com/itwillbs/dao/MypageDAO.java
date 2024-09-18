package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Repository
@Log4j2
@AllArgsConstructor
public class MypageDAO {

	private final SqlSession sqlSession;

	private static final String NAMESPACE = "com.itwillbs.mapper.MypageMapper";

	public BookingDTO getBooking(Integer bookingId) {
		BookingDTO result = sqlSession.selectOne(NAMESPACE + ".getBooking", bookingId);
	    log.info("getBooking result: " + result);
	    return result;
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
}
